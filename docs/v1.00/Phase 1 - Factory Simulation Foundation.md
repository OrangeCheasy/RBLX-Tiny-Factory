# Phase 1 — Factory Simulation Foundation

## Objective
Create the smallest deterministic production pipeline: producer → path → processor → seller.

## Player-Facing Result
- Items visibly spawn, move through the route, get processed, and sell for Coins.
- A test factory can run continuously without player input.

## Systems
- Factory runtime
- Logical item state
- Single-route path
- Producer
- Processor hook
- Seller
- Currency transaction stub

## Technical Work
- Define compact item state.
- Implement server-owned route progress.
- Implement machine processing contract.
- Add active-item cap.
- Separate logical simulation from visual rendering.
- Establish shared definition tables for IDs and basic parameters.

## Gameplay Work
- Basic Dropper creates one item archetype.
- One test multiplier visibly changes value.
- Seller converts item value into Coins.
- Add throughput limits so congestion can be observed.

## UI/UX Work
- Minimal debug HUD for Coins, active items, and production rate.
- No final inventory or roll UI yet.

## Art / Audio / Asset Requirements
- Placeholder conveyor/path
- Placeholder producer, processor, seller
- Simple cube item
- Temporary machine activation sounds/effects

## Dependencies
None. This is the technical foundation.

## Analytics / Instrumentation
- Record item produced/sold counts in local/server diagnostics.
- Track production rate and active item count for test sessions.

## Security / Exploit Considerations
- Server owns item creation, processing, and sale value.
- No client remote may grant Coins.
- Clamp/sanity-check values.

## Performance Considerations
- No item-item collisions.
- No per-item physics dependency.
- No heartbeat connection per machine.
- Enforce a strict item cap.

## Automated Validation
- Unit tests for value processing math.
- Tests for cap behavior.
- Static/lint/type checks used by the repository.
- CI boots project and validates definitions.

## Manual Validation
- Watch long-running pipeline for stalls.
- Confirm visual and logical item order match.
- Verify item cap behavior feels graceful.
- Test two or more players' test factories do not interfere.

## Scope Classification
### Required Now
- deterministic pipeline
- seller reward
- one processor hook
- item cap
### Valuable Later
- richer item visuals
- multiple producers
- pooling improvements
### Scope Creep
- modular logistics graph
- splitters
- research
- inventory

## Explicitly Out of Scope
- Rolling
- persistent saving
- final placement system
- multiple routes
- launch machine library
- prestige/social systems

## Completion Definition
Phase is complete when one server-authoritative factory line can run for an extended test, process items correctly, reward Coins, respect caps, and pass automated math/state tests.
