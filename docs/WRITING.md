# Writing Guide

This site stays on the GitHub Pages Jekyll runtime. Do not upgrade to a custom
Jekyll major version unless the deployment model also changes.

## Posts

- Use `.md` for new posts.
- Name files as `_posts/YYYY-MM-DD-descriptive-slug.md`.
- Keep the filename slug, title, and article topic aligned.
- Use front matter with `layout`, `title`, and `date`.
- Add `redirect_from` when replacing an old URL.
- Do not duplicate old posts to create new entries.

## Markdown

- Put a blank line before and after fenced code blocks.
- Use lower-case code fence languages, such as `java`, `xml`, `yaml`, or
  `properties`.
- Avoid trailing two-space hard line breaks; use paragraphs or lists instead.
- Prefer normal Markdown links over raw URLs unless the raw URL is the content.
- Keep list items short enough to scan on mobile.

## Resume

- Treat `/resume/` and `/resume/chinese` as public identity pages.
- Keep role titles, dates, and public positioning current.
- Avoid publishing phone numbers, family details, or employer-sensitive system
  details.
- Prefer concrete scope and engineering judgment over broad technology lists.

## Checks

Run this before publishing:

```bash
ruby scripts/check_content.rb
bundle exec jekyll build --trace
```
