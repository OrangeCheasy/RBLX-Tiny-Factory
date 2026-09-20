# Phase 2 — Building & Placement

## Objective
Let players safely place, move, rotate, and remove machines on a deliberately constrained v1 layout.

## Player-Facing Result
- Player enters build mode, selects a machine placeholder, previews placement, commits it, moves it, and removes it.
- The production route updates immediately.

## Systems
- Build mode
- Slot/grid occupancy
- Placement validation
- Move/remove transaction
- Client preview
- Server factory layout state

## Technical Work
- Define slot IDs and allowed machine categories.
- Add authoritative placement requests.
- Ensure move operations cannot duplicate machines.
- Serialize layout into a compact structure suitable for later saving.

## Gameplay Work
- Machine order changes actual processing order.
- Invalid placements are rejected clearly.
- Removing a machine returns it to a temporary inventory stub.

## UI/UX Work
- Build-mode toggle
- Machine selection strip
- Valid/invalid placement highlight
- Rotate/cancel/remove controls
- Touch-friendly buttons

## Art / Audio / Asset Requirements
- Placeholder placement ghost
- Slot markers
- Selection/highlight effect
- Build confirmation/error audio

## Dependencies
Phase 1 simulation and machine contract.

## Analytics / Instrumentation
- Placement success/failure reason
- Move/remove count
- Time spent in build mode
- Layout change count

## Security / Exploit Considerations
- Validate ownership, slot availability, capacity, machine ID, and request rate.
- Make move transactional: old state is not released until destination is valid.

## Performance Considerations
- Placement preview runs locally.
- Server validates only committed actions.
- Avoid scanning all workspace descendants for every request.

## Automated Validation
- Placement validation tests
- Occupancy conflict tests
- Move/remove inventory conservation tests
- Layout serialization tests

## Manual Validation
- Desktop placement feel
- Mobile placement feel
- Reordering clarity
- Rapid move/remove attempts
- Two-player isolation

## Scope Classification
### Required Now
- place/move/remove
- server validation
- mobile controls
- order affects production
### Valuable Later
- copy tool
- drag multi-select
- free conveyor placement
### Scope Creep
- full Factorio building
- blueprints
- terrain editor

## Explicitly Out of Scope
- Roll system
- final inventory
- modular conveyors
- multiple lines
- cosmetics

## Completion Definition
Phase is complete when a desktop and mobile player can repeatedly rebuild a single production line without duplication, invalid overlap, or confusing controls.
