# Phase 3 — Factory Showcase & Visiting

## Objective
Add social comparison in a way that works even when servers are small and visitors cannot damage owners.

## Player-Facing Result
- Players can publish/showcase a factory and visit read-only representations of other factories.

## Systems
- Showcase snapshot
- visit loading
- privacy/settings
- friend/discovery hooks as available

## Technical Work
- Generate sanitized read-only factory snapshots.
- Version snapshot schema.
- Never grant visitor write access to owner state.
- Handle missing/deprecated content safely.

## Gameplay Work
- Visitors can observe production and inspect machines.
- Optional reactions/favorites only if abuse/moderation cost is low.

## UI/UX Work
- Visit/showcase browser
- owner identity presentation consistent with platform rules
- return-to-own-factory flow

## Art / Audio / Asset Requirements
- showcase signage/minimal presentation polish.

## Dependencies
Stable v2 layout schema and v3 player profile.

## Analytics / Instrumentation
- showcases published
- visits
- visit duration
- post-visit rebuild activity

## Security / Exploit Considerations
- Sanitize snapshot data.
- Rate-limit discovery.
- No arbitrary text if moderation burden is unnecessary.
- Read-only visitor mode.

## Performance Considerations
- Load bounded snapshots.
- Apply LOD/item simulation limits to visited factories.

## Automated Validation
- snapshot serialization tests
- sanitization tests
- deprecated-machine fallback tests

## Manual Validation
- visit loading
- low-population usefulness
- mobile browsing
- owner/visitor data isolation

## Scope Classification
### Required Now
- safe read-only visits
- showcase snapshots
### Valuable Later
- likes/favorites
- curated discovery
### Scope Creep
- open-ended social feed
- player chat features beyond platform defaults

## Explicitly Out of Scope
- trading
- co-owned persistent factories

## Completion Definition
Complete when players can safely showcase and inspect factories without requiring concurrent population or exposing owner data to mutation.
