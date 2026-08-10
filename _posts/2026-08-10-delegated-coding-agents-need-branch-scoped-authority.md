---
layout: post
title: "Delegated Coding Agents Need Branch-Scoped Authority First"
date: 2026-08-10 19:50 +0800
---

Coding agents are becoming useful enough that the hard question is no longer
"can an agent write code?" The harder question is: who gave it authority to make
a change, what exactly was it allowed to touch, and how do we prove that after
the work is done?

For enterprise use, this is the real product boundary. A coding agent without
clear authority is just a very fast contractor with unclear access. It may
produce a good patch, but the organization still has to answer a few basic
questions:

- Which human or system requested the work?
- Which repository, branch, issue, and pull request was in scope?
- Which actions were allowed automatically?
- Which actions required approval before they happened?
- What evidence shows the agent stayed inside the boundary?
- What happens if the task is cancelled or the authority is revoked?

My current view is that the first credible MVP should not start as a generic
agent-to-agent platform. It should start with delegated coding work in GitHub,
using branch-scoped authority as the primary control point.

## Why GitHub Is The Natural First Boundary

For coding work, the useful artifact usually ends up in GitHub anyway: an issue,
a branch, a commit, a pull request, a check run, a review, or a comment. That
means GitHub already holds many of the identifiers needed for governance.

A GitHub-first model can bind one delegated task to:

- the requester and the issue or PR comment that triggered the work
- the target repository and target branch
- a delegated branch created for this task
- a short-lived credential for that branch
- the commits, PR, check runs, test logs, and review result

That is a much stronger starting point than trying to govern an agent through
conversation alone. The authority is attached to a concrete resource boundary,
not just to a prompt.

## Why Not Start With A Generic A2A Or MCP Platform?

A generic A2A router is useful for remote delegation, task lifecycle, messages,
streaming, and cancellation. An MCP gateway is useful for filtering tools,
gating tool calls, and recording tool results.

Both are valuable, but neither is the best first anchor for coding-agent
governance.

An A2A router can say that one agent delegated a task to another agent. It does
not, by itself, stop an agent from pushing to the wrong branch, opening a PR with
the wrong scope, reading protected secrets, or triggering a deployment.

An MCP gateway can govern MCP tools. It does not cover direct GitHub writes,
shell commands, local Git credentials, CI credentials, or agent actions that
bypass MCP entirely.

The first MVP should prove enforcement, not only observation. If the system only
records what happened after the fact, it is an audit log, not a governance
boundary.

## The Minimal Authority Model

A delegated coding task needs a small set of first-class objects:

- a task envelope that records the objective, scope, state, risk, artifacts, and
  correlation ids
- an authority grant that says what the executor may do, where, for how long,
  and under which policy decision
- approval requests for actions above the auto-allow threshold
- artifact references for plans, diffs, commits, PRs, check runs, test logs, and
  review summaries
- append-only audit events that connect the request, grant, actions, approvals,
  artifacts, and closure

The important design choice is that no side-effecting work should start without
an active grant. Approval should happen before risky side effects, not as a
retrospective review of something the agent already did.

## What The MVP Should Allow

The smallest useful path is narrow:

- read the repository
- create or update one delegated branch
- create or update a pull request from that branch
- post issue or PR comments
- update check status
- attach evidence such as diff, test output, and review summary

This is enough to demonstrate useful coding work. The agent can still produce a
real PR that a human can review.

## What The MVP Should Deny

The MVP should explicitly deny:

- merge
- deploy
- protected branch writes
- protected secret reads
- external sharing of prompts, logs, diffs, screenshots, or repo data
- unapproved workflow triggers

These denials matter more than they look. Without them, the system cannot claim
to govern coding agents. It can only claim to watch them.

## Runtime Wrapping Still Matters

GitHub branch authority is not enough by itself. It cannot see every local shell
command, every dependency download, every prompt, or every MCP call.

The practical architecture is layered:

- GitHub App branch permissions as the primary chokepoint
- a workflow wrapper for controlled execution, credential injection, tests,
  artifact collection, and cancellation
- an MCP gateway when the task needs external tools

That layering keeps the first product small while leaving room for broader
agent-to-agent workflows later.

## Revocation Is Not Undo

Revoking a grant does not erase work that already happened. A push may have
completed before revocation. A workflow step may be in flight. A PR may already
exist.

So the system needs to record revocation as evidence:

- expire the credential first
- cancel the workflow second
- deny future writes
- mark post-revocation artifacts as tainted or requiring manual review
- close the evidence bundle with the race outcome

This is less elegant than pretending cancellation is instant, but it is closer
to how real distributed systems behave.

## The Product Lesson

The tempting path is to build a broad agent delegation platform first: generic
tasks, generic routing, generic tools, generic approvals. That may be the final
shape, but it is too wide for the first proof.

The stronger wedge is narrower:

prove that one GitHub issue can create one governed coding task, give one agent
one short-lived branch-scoped grant, produce one PR, deny the dangerous actions,
and close one evidence bundle that explains who authorized what.

If that works, the platform has a real enforcement core. If it does not, a
larger A2A system will only distribute the same trust problem across more
places.
