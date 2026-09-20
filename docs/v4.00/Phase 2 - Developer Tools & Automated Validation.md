# Phase 2 — Developer Tools & Automated Validation

## Objective
Reduce debugging and balancing time through internal tools and simulation tests.

## Player-Facing Result
- Fewer broken updates and more consistent balance.

## Systems
- Factory debug inspector
- machine spawner/test bench
- simulation runner
- economy sanity checks
- content audit reports

## Technical Work
- Build developer-only commands/UI with strict authorization.
- Create headless or deterministic factory test scenarios.
- Generate balance summaries.

## Gameplay Work
- Use representative factory archetypes for automated comparison.

## UI/UX Work
- Internal debug panels only.
- Clear production/build labels to prevent accidental exposure.

## Art / Audio / Asset Requirements
- None beyond debug icons if useful.

## Dependencies
Data-driven content pipeline.

## Analytics / Instrumentation
- Tool usage is optional; operational logs may record validation runs.

## Security / Exploit Considerations
- Strong admin authorization.
- No client-only trust for privileged actions.
- Disable or gate debug interfaces in production.

## Performance Considerations
- Debug instrumentation must be cheap or disabled outside test mode.

## Automated Validation
- simulation snapshots
- expected-value bounds
- machine interaction regression
- config diff checks

## Manual Validation
- Reproduce known bugs using tools.
- Verify production build hides restricted controls.

## Scope Classification
### Required Now
- debug tools
- repeatable simulation tests
### Valuable Later
- richer internal dashboards
### Scope Creep
- general-purpose in-game code console

## Explicitly Out of Scope
- player-accessible admin functionality

## Completion Definition
Complete when common machine/economy bugs can be reproduced and caught substantially faster than through manual live play alone.
