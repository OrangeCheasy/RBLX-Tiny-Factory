# Phase 5 — Long-Term Progression Validation

## Objective
Decide whether the new progression/social layers genuinely improve retention and factory depth, and whether prestige is justified.

## Player-Facing Result
- The retained v3 systems form a coherent long-term loop around factory experimentation.

## Systems
- Balance review
- progression tuning
- optional prestige prototype only behind a validation gate

## Technical Work
- Audit persistent state growth.
- Profile social/progression services.
- Strengthen migrations and fallback paths.

## Gameplay Work
- Remove goals that produce chores.
- Tune research/challenges.
- Evaluate prestige using a prototype only if reset play has a unique strategic payoff.

## UI/UX Work
- Simplify any screens that became bloated.

## Art / Audio / Asset Requirements
- Finalize only retained systems.

## Dependencies
All v3 systems.

## Analytics / Instrumentation
- return behavior by progression engagement
- research diversity
- challenge impact
- showcase-to-rebuild correlation
- social feature usage

## Security / Exploit Considerations
- Full progression/social exploit audit.

## Performance Considerations
- Profile visited factories, leaderboards, challenge evaluation, save size.

## Automated Validation
- full CI
- migration suite
- progression invariants
- record validation
- snapshot tests

## Manual Validation
- long-horizon test accounts
- returning player comprehension
- low-pop server
- mobile navigation
- prestige prototype test if applicable

## Scope Classification
### Required Now
- evidence-based retention layer
- safe progression
### Valuable Later
- prestige if validated
- more social depth
### Scope Creep
- adding trading because v3 is “social”

## Explicitly Out of Scope
- live-service tooling belongs to v4.

## Completion Definition
v3.00 exits when long-term systems demonstrably reinforce factory play, social features remain optional, and any prestige decision is based on evidence rather than genre convention.
