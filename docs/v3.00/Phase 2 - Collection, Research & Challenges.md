# Phase 2 — Collection, Research & Challenges

## Objective
Turn machine discovery and strategic specialization into long-term goals.

## Player-Facing Result
- Players complete machine collections, choose research directions, and pursue repeatable or rotating factory challenges.

## Systems
- Collection
- Research
- Challenge framework
- Reward rules

## Technical Work
- Data-driven challenge definitions.
- Research prerequisites/effects constrained to approved hooks.
- Server completion evaluation.

## Gameplay Work
- Collection rewards discovery without requiring impossible rarity luck.
- Research unlocks options or specialization.
- Challenges ask players to build differently.

## UI/UX Work
- Collection book
- compact research screen
- challenge cards/progress

## Art / Audio / Asset Requirements
- collection silhouettes/icons
- research nodes/icons
- challenge badges

## Dependencies
Meta-progression foundation.

## Analytics / Instrumentation
- collection completion
- research choice distribution
- challenge starts/completions
- layout diversity impact

## Security / Exploit Considerations
- Server-evaluate challenge metrics.
- Prevent reward replay.
- Avoid client-submitted completion.

## Performance Considerations
- Aggregate challenge counters.
- Avoid expensive retrospective queries.

## Automated Validation
- challenge definition validator
- prerequisite tests
- reward tests

## Manual Validation
- Are challenges actually changing layouts?
- Are research choices understandable?
- Does collection create frustration?

## Scope Classification
### Required Now
- collection
- research/specialization
- challenges
### Valuable Later
- seasonal challenge sets
### Scope Creep
- battle pass
- dozens of research currencies

## Explicitly Out of Scope
- prestige unless testing justifies it later

## Completion Definition
Complete when each system drives players back into factory experimentation rather than passive checklist completion.
