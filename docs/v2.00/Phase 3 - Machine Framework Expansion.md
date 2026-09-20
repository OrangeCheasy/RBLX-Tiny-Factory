# Phase 3 — Machine Framework Expansion

## Objective
Scale content without scaling code complexity at the same rate.

## Player-Facing Result
- A larger machine pool supports distinct factory strategies and new branch interactions.

## Systems
- Behavior composition
- richer tags
- compatibility rules
- machine definition schema v2
- content validator

## Technical Work
- Refactor repeated bespoke logic into reusable behaviors.
- Add definition validation.
- Support richer input/output constraints.
- Add per-machine processing cost metrics.

## Gameplay Work
- Expand toward roughly 20–35 total machines only as justified.
- Add converters, sorters, conditional/risk machines selectively.
- Preserve usefulness of earlier machines.

## UI/UX Work
- Better tooltips for compatibility and throughput.
- Category filtering if inventory size now requires it.

## Art / Audio / Asset Requirements
- New machine models/effects prioritized by mechanical readability.

## Dependencies
Stable branched logistics.

## Analytics / Instrumentation
- content usage
- pair/order frequency
- branch-specific machine usage
- dead content
- dominant combinations

## Security / Exploit Considerations
- Server validates all behavior parameters from trusted definitions.
- Bound random/output-heavy mechanics.

## Performance Considerations
- Budget each machine behavior.
- Profile worst-case stacked chains.
- No unbounded scans.

## Automated Validation
- Definition schema tests
- behavior-module tests
- representative interaction matrix
- production upper-bound simulations

## Manual Validation
- Strategy diversity
- readability of new machines
- low-rarity relevance
- no universally optimal chain

## Scope Classification
### Required Now
- reusable content framework
- meaningful new machine categories
### Valuable Later
- machine skins
- special event variants
### Scope Creep
- hundreds of machines
- per-machine unique subsystem

## Explicitly Out of Scope
- live-service content tooling beyond basic validators

## Completion Definition
Complete when adding a standard new machine is mostly configuration + reusable behavior, and the expanded pool demonstrably creates distinct strategies.
