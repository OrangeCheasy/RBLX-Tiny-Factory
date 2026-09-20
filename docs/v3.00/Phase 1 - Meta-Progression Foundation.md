# Phase 1 — Meta-Progression Foundation

## Objective
Create a durable progression model that rewards factory play without contaminating the core simulation with permanent multiplier creep.

## Player-Facing Result
- Factory activity contributes to persistent goals beyond Coins and current machines.

## Systems
- Progression profile
- milestone framework
- unlock framework
- reward claims
- schema evolution

## Technical Work
- Separate meta state from factory runtime state.
- Server-authoritative milestone evaluation.
- Idempotent reward claiming.
- Migration path.

## Gameplay Work
- Define progression that unlocks options, categories, cosmetics, or strategic choices rather than raw endless power.

## UI/UX Work
- Progress overview
- milestone/reward clarity
- no sprawling skill tree yet

## Art / Audio / Asset Requirements
- Minimal progression icons/badges.

## Dependencies
Validated v2 factory depth.

## Analytics / Instrumentation
- progression pace
- milestone completion
- reward claim
- effect on factory experimentation

## Security / Exploit Considerations
- Validate completion on server.
- Prevent repeat claims.
- Sanitize migrated progression state.

## Performance Considerations
- Event-driven milestone checks rather than full scans.

## Automated Validation
- reward idempotency tests
- migration tests
- milestone condition tests

## Manual Validation
- Does progression motivate more factory play?
- Does it distract from rebuilding?

## Scope Classification
### Required Now
- clean progression data model
- meaningful unlocks
### Valuable Later
- prestige
- seasonal tracks
### Scope Creep
- giant skill tree
- multiplier-only meta

## Explicitly Out of Scope
- trading
- clans

## Completion Definition
Complete when long-term state is secure, migration-safe, and demonstrably tied to meaningful factory actions.
