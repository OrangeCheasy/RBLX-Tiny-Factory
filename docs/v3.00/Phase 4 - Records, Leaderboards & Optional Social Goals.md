# Phase 4 — Records, Leaderboards & Optional Social Goals

## Objective
Add fair comparison and optional shared goals without making competitive spending or server population mandatory.

## Player-Facing Result
- Players can pursue production records, friend/global comparisons, and limited optional community goals.

## Systems
- Validated record service
- leaderboard publishing
- optional cooperative target framework

## Technical Work
- Compute records server-side from legitimate simulation.
- Add submission sanity checks.
- Cache leaderboard reads appropriately.

## Gameplay Work
- Prefer multiple record categories over one universal “richest player.”
- Examples: throughput, value/item, challenge-specific records.
- Shared goals should reward participation, not force co-op.

## UI/UX Work
- Record panel
- leaderboard categories
- optional contribution tracker

## Art / Audio / Asset Requirements
- record badges/trophies if inexpensive.

## Dependencies
Stable factory stats and progression.

## Analytics / Instrumentation
- leaderboard participation
- record attempts
- social-goal engagement
- effect on build diversity

## Security / Exploit Considerations
- Reject impossible records.
- Monitor exploit outliers.
- Never trust client score submissions.

## Performance Considerations
- Rate-limit submissions.
- Cache reads.
- Avoid continuous global updates.

## Automated Validation
- record validation tests
- impossible-score tests
- reward idempotency

## Manual Validation
- Fairness perception
- low-population usability
- exploit attempts
- performance of boards

## Scope Classification
### Required Now
- secure records
- low-dependency social comparison
### Valuable Later
- co-op events
- team goals
### Scope Creep
- pay-to-win ranked ladder
- mandatory groups/clans

## Explicitly Out of Scope
- market/trading

## Completion Definition
Complete when social comparison is secure, optional, and does not distort the factory into a spending contest.
