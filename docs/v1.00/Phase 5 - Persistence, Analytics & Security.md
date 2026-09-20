# Phase 5 — Persistence, Analytics & Security

## Objective
Make the factory safe to leave, return to, measure, and expose to public players.

## Player-Facing Result
- Progress reliably survives reconnects.
- Factory layout, Coins, inventory, discoveries, and capacity restore correctly.

## Systems
- DataService
- Schema migrations
- Session conflict protection
- AnalyticsService
- AntiExploitService/logging

## Technical Work
- Define v1 save schema.
- Add migration version.
- Save only durable state.
- Centralize mutations through services.
- Add analytics events from authoritative sources.
- Add structured rejection/security logging.

## Gameplay Work
- Restore factory to a valid state after load.
- Recover safely from missing/deprecated machine definitions using a fallback policy.

## UI/UX Work
- Save/load failure messaging only where player action is needed.
- Optional “saving” indicator if it improves trust without noise.

## Art / Audio / Asset Requirements
- Minimal error/status icons if needed.

## Dependencies
Stable v1 factory, inventory, and economy data models.

## Analytics / Instrumentation
- Full launch funnel
- layout changes
- economy flows
- quit points
- production milestones
- return-session identifiers where platform-safe

## Security / Exploit Considerations
- Duplicate session/save protection.
- Remote throttling.
- Impossible production/currency anomaly checks.
- Strict schema sanitization.

## Performance Considerations
- Bound save size.
- Aggregate high-volume events.
- Avoid per-item external analytics.

## Automated Validation
- Save/load round-trip tests
- migration tests
- malformed data tests
- remote validation tests
- analytics schema validation

## Manual Validation
- Rejoin tests
- forced disconnect/reconnect
- multi-device/session conflict behavior
- corrupted/default-safe data path
- analytics dashboard/event inspection

## Scope Classification
### Required Now
- reliable save
- schema versioning
- analytics
- anti-exploit validation
### Valuable Later
- admin dashboard
- rollback tools
- full observability
### Scope Creep
- market-grade ledger
- giant custom backend
- real-time per-item telemetry

## Explicitly Out of Scope
- trading protection
- event ops
- live config

## Completion Definition
Phase is complete when persistent state survives realistic reconnect/failure tests, analytics answer the v1 validation questions, and major economy remotes have explicit validation and rate limits.
