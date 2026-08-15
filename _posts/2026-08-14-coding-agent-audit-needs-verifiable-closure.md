---
layout: post
title: "Coding Agent Audit Needs Verifiable Closure"
date: 2026-08-14 23:10 +0800
---

Most discussions about coding agents still focus on the visible work: the patch,
the pull request, the test result, or the review comment. That is natural,
because those are the things developers can inspect directly.

But if coding agents are going to run inside serious engineering organizations,
the harder question comes after the work is done:

can a third party reconstruct who authorized the work, what the agent was
allowed to do, what it actually did, and why the task was closed?

That is not solved by keeping more logs. It needs a verifiable closure record.

## Logs Are Not Enough

Logs are useful while debugging. They are bad as the final unit of trust.

Raw logs are too noisy, too inconsistent, and too dependent on the systems that
produced them. GitHub has its own objects. CI has workflow runs and check runs.
An agent runtime may have prompts, tool calls, shell commands, screenshots, and
intermediate files. An MCP gateway may have tool request and response records.
Human review happens in issues, pull requests, chats, or internal approval
systems.

If the only answer is "go search all the logs", audit becomes a forensic
exercise. That may work after an incident, but it is not a product boundary.

The system needs a compact evidence bundle that says: this task reached this
terminal state, under this authority, with these external references, these
artifact hashes, and this closure reason.

## The Evidence Bundle Is An Index, Not An Archive

The evidence bundle should not copy every prompt, diff, workflow log, or
screenshot into one giant object.

That sounds convenient, but it creates the wrong incentives. It increases
privacy exposure, duplicates large payloads, complicates retention, and makes it
harder to redact sensitive data. It also encourages people to treat the bundle
as a data lake instead of as an audit control.

The better model is an indexed closure record:

- task id and trace id
- requester, on-behalf-of identity, and executor identity
- repository, issue, branch, pull request, commits, workflow runs, and check runs
- authority grant ids and their final status
- approval request and decision references
- artifact references and hashes
- final task state and final artifact state
- retention and redaction policy
- event-chain hash and bundle hash

The raw payloads can stay where they belong: in GitHub, CI, artifact storage, or
tenant-controlled storage. The bundle only needs enough structure to prove what
happened and where the underlying evidence can be found.

## Closure Must Handle More Than Success

A common mistake is to design the audit flow around the happy path:

issue created, agent runs, PR opened, tests pass, human approves, task done.

That is not enough. Real systems have cancellation, revocation, partial failure,
approval timeout, missing external ids, uncorrelated commits, hash mismatches,
and work that completes after the authority was withdrawn.

The closure model has to support terminal states beyond `accepted`:

- `rejected` when the artifact is unusable
- `needs_revision` when the artifact is useful but incomplete
- `cancelled` when the requester or policy stops the task
- `revoked` when authority is withdrawn
- `expired` when the grant or task times out
- `blocked` when required input or evidence is missing
- `failed` when a tool, workflow, or platform action fails
- `tainted` when work may have happened outside the trusted boundary

This looks heavy, but it is just being honest about distributed systems. If
revocation races with a Git push, the system should not pretend nothing
happened. It should record the race, expire future authority, preserve the
evidence, and require human review before trusting the output.

## Signing Gives Non-Repudiation

Once the evidence bundle is closed, it should be signed by the tenant.

The point is not to make the JSON fancy. The point is to let an auditor verify
that this specific tenant attested to this specific bundle hash at this point in
the task lifecycle.

A practical signing flow can stay simple:

- canonicalize the bundle JSON
- compute the bundle hash
- sign the hash using a tenant-controlled key
- record the signing key reference, algorithm, signature, and timestamp
- keep the signature detached so the bundle remains readable

The signing key should belong to the tenant or its controlled KMS/HSM boundary,
not to the agent vendor alone. Otherwise the vendor can prove that it signed
something, but the enterprise still cannot cleanly say that the tenant accepted
the closure record.

## Anchoring Makes Backdating Harder

Signing proves who attested to the bundle. Anchoring helps prove when the bundle
existed.

The anchor does not need to be exotic. A few options are enough:

- git notes on a dedicated audit branch for a lightweight internal trail
- Sigstore Rekor for a public transparency log with OIDC-friendly workflows
- a public chain only when the tenant has a real reason to pay the operational
  complexity

For most engineering organizations, Sigstore is probably the most practical
default. It avoids inventing a blockchain story, gives a verifiable transparency
log, and maps reasonably well to modern CI identity.

The bundle then carries an anchor receipt: provider, URL, entry id, timestamp,
and the anchored hash. A verifier can recompute the bundle hash, verify the
tenant signature, and check the anchor entry.

## The Verification Path Matters

The important test is whether someone outside the original execution path can
replay the logic:

- reconstruct the event chain for the task
- verify the state transitions
- check that side-effecting actions had active authority or explicit approval
- confirm that the grant ended before accepted closure
- verify artifact hashes and external ids
- recompute the bundle hash
- verify the tenant signature
- verify the external anchor receipt

If that works, the organization has something stronger than "the agent said it
finished". It has a closure credential.

## The Product Lesson

For coding-agent governance, audit should not be treated as a pile of logs at
the edge of the system.

The product boundary should be:

one delegated task, one scoped authority grant, one reviewable artifact trail,
one terminal decision, and one verifiable evidence bundle.

That is the difference between an agent that merely produces code and an agent
whose work can be governed after the fact.

The first version does not need to solve every enterprise workflow. It needs to
prove a narrow loop: create a branch-scoped task, produce a PR, deny dangerous
actions, review the result, close the authority, sign the evidence bundle, and
anchor the hash.

If that loop is solid, a broader agent delegation platform has a real trust
foundation. If that loop is missing, more orchestration only creates more places
where nobody can say exactly what happened.
