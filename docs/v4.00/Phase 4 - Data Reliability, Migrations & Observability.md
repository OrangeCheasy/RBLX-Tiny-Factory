# Phase 4 — Data Reliability, Migrations & Observability

## Objective
Make schema/economy changes diagnosable and recoverable enough for ongoing live operation.

## Player-Facing Result
- Fewer lost-progress incidents and safer updates.

## Systems
- Migration runner
- migration status logging
- save health metrics
- rollback/recovery procedures
- economy/performance observability

## Technical Work
- Dry-run or test migrations against fixtures.
- Track schema distributions.
- Add structured error categories.
- Define backup/recovery procedures supported by the platform.

## Gameplay Work
- No new player-facing mechanic required.

## UI/UX Work
- Player-safe error/recovery messaging where needed.

## Art / Audio / Asset Requirements
- None.

## Dependencies
Existing persistence plus developer tooling.

## Analytics / Instrumentation
- migration success/failure
- save latency/failure
- schema version
- economy anomalies
- performance health

## Security / Exploit Considerations
- Protect privileged recovery/admin actions.
- Avoid exposing sensitive internal data to clients.

## Performance Considerations
- Observability must be aggregated and bounded.

## Automated Validation
- migration fixture suite
- backward compatibility tests
- malformed data tests
- rollback procedure checks where automatable

## Manual Validation
- test migration across several historical fixtures
- forced failure/recovery drill
- inspect operational metrics

## Scope Classification
### Required Now
- migration safety
- save observability
- recovery plan
### Valuable Later
- advanced dashboards
### Scope Creep
- building a custom database platform

## Explicitly Out of Scope
- unrelated backend infrastructure

## Completion Definition
Complete when schema changes can be tested before release, migration failures are visible, and a documented recovery path exists.
