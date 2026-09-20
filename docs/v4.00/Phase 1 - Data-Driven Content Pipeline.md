# Phase 1 — Data-Driven Content Pipeline

## Objective
Make standard machine/content additions primarily a data/configuration task while preserving safe behavior boundaries.

## Player-Facing Result
- Content can be added more consistently with fewer regressions.

## Systems
- Machine schema v3
- Content registry
- Templates
- Validation rules

## Technical Work
- Formalize supported definition fields.
- Separate safe numeric/config changes from code behaviors.
- Add versioned content IDs and deprecation handling.

## Gameplay Work
- No major new mechanic required; use existing machines as migration cases.

## UI/UX Work
- Ensure UI reads definitions rather than duplicated hard-coded labels.

## Art / Audio / Asset Requirements
- Standard asset naming/registry rules.

## Dependencies
Stable v2/v3 machine architecture.

## Analytics / Instrumentation
- content ID consistency
- definition load errors
- deprecated content usage

## Security / Exploit Considerations
- Configs cannot grant arbitrary code execution.
- Validate ranges and allowed behavior names.

## Performance Considerations
- Pre-validate at build/startup; avoid expensive runtime reflection.

## Automated Validation
- schema validator
- duplicate ID detection
- missing asset/config detection
- range validation

## Manual Validation
- Add a test machine end-to-end without touching central simulation code.

## Scope Classification
### Required Now
- schema
- registry
- validation
### Valuable Later
- visual authoring UI
### Scope Creep
- dynamic arbitrary scripts from remote config

## Explicitly Out of Scope
- fully user-generated machines

## Completion Definition
Complete when a normal new machine can be added safely through definitions plus approved reusable behavior without central-system edits.
