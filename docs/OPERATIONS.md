# Site Operations

## Operating Model

- Keep `master` deployable.
- Prepare changes on topic branches.
- Use pull requests for review before publishing.
- Treat public identity, resume, and content positioning changes as review-required.
- Keep automation focused on build safety, dependency hygiene, and routine maintenance.

## Automation

- `Site check` runs on pull requests and pushes to `master`.
- Dependabot checks Ruby dependencies and GitHub Actions weekly.
- Drafts live in `_drafts/` until they are approved for publication.

## Routine Maintenance

- Review Dependabot pull requests when they appear.
- Fix build failures before merging content.
- Periodically check old links, but do not fail every build on archived external links until a baseline cleanup has been done.
- Keep `_config.yml`, navigation, and resume content aligned with the intended public profile.

## Content Backlog

Good long-running themes for this site:

- Distributed systems and backend engineering notes.
- Engineering management lessons from real delivery work.
- Practical Java, Spring, Kafka, Redis, and observability writeups.
- Running and marathon training reflections.
- Singapore life notes where they are useful and non-private.
