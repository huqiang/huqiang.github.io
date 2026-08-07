#!/usr/bin/env ruby
# frozen_string_literal: true

require "date"
require "time"
require "yaml"

errors = []

def modern_post?(path)
  match = File.basename(path).match(/\A(\d{4})-\d{2}-\d{2}-.*\.(md|markdown)\z/)
  match && match[1].to_i >= 2019
end

def source_files
  patterns = [
    "README.md",
    "Gemfile",
    "_config.yml",
    "_data/**/*.yml",
    "_drafts/**/*.{md,markdown}",
    "docs/**/*.{md,markdown}",
    "index.md",
    "resume/**/*.{md,markdown}"
  ]

  files = patterns.flat_map { |pattern| Dir.glob(pattern) }.select { |path| File.file?(path) }
  files.concat(Dir.glob("_posts/*.{md,markdown}").select { |path| modern_post?(path) })
  files.uniq.sort
end

def front_matter(path)
  text = File.read(path)
  match = text.match(/\A---\n(.*?)\n---\n/m)
  return {} unless match

  YAML.safe_load(match[1], permitted_classes: [Date, Time], aliases: false) || {}
rescue Psych::SyntaxError => e
  { "__yaml_error__" => e.message }
end

source_files.each do |path|
  lines = File.readlines(path, chomp: false)
  in_fence = false

  lines.each_with_index do |line, index|
    number = index + 1
    stripped = line.strip

    errors << "#{path}:#{number}: trailing whitespace" if line.match?(/[ \t]\n\z/)

    next unless stripped.start_with?("```")

    if in_fence
      following = lines[index + 1]&.strip.to_s
      unless following.empty?
        errors << "#{path}:#{number}: put a blank line after fenced code blocks"
      end
      in_fence = false
      next
    end

    in_fence = true
    language = stripped.delete_prefix("```").split(/\s+/, 2).first.to_s
    if !language.empty? && language != language.downcase
      errors << "#{path}:#{number}: code fence language should be lower-case"
    end

    previous = index.zero? ? "" : lines[index - 1].strip
    unless previous.empty?
      errors << "#{path}:#{number}: put a blank line before fenced code blocks"
    end
  end

  errors << "#{path}: unclosed fenced code block" if in_fence
end

titles = Hash.new { |hash, key| hash[key] = [] }

Dir.glob("_posts/*.{md,markdown}").select { |path| modern_post?(path) }.sort.each do |path|
  metadata = front_matter(path)
  if metadata.key?("__yaml_error__")
    errors << "#{path}: invalid front matter: #{metadata['__yaml_error__']}"
    next
  end

  %w[layout title date].each do |key|
    value = metadata[key]
    errors << "#{path}: missing front matter #{key}" if value.nil? || value.to_s.strip.empty?
  end

  if metadata["layout"] && metadata["layout"] != "post"
    errors << "#{path}: post layout should be 'post'"
  end

  title = metadata["title"].to_s.strip
  titles[title.downcase] << path unless title.empty?
end

Dir.glob("_posts/*.{md,markdown}").reject { |path| modern_post?(path) }.sort.each do |path|
  metadata = front_matter(path)
  next if metadata.key?("__yaml_error__")

  title = metadata["title"].to_s.strip
  titles[title.downcase] << path unless title.empty?
end

titles.each do |title, paths|
  next if paths.length == 1

  errors << "duplicate post title '#{title}': #{paths.join(', ')}"
end

if errors.empty?
  puts "Content format check passed."
else
  warn errors.join("\n")
  exit 1
end
