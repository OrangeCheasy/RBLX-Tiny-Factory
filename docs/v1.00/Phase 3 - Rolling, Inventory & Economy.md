# Phase 3 — Rolling, Inventory & Economy

## Objective
Implement the acquisition/economy loop that turns production into new factory choices.

## Player-Facing Result
- Coins buy a machine roll.
- Rolled machines enter inventory.
- Players can place, store, or sell machines.
- Capacity upgrades compete with rolls for Coins.

## Systems
- RollService
- InventoryService
- EconomyService
- Rarity tables
- Resale
- Capacity upgrades

## Technical Work
- Server-only weighted RNG.
- Configurable roll costs, weights, refunds, and capacity prices.
- Atomic purchase/grant flow.
- Inventory quantities by machine ID where instances are equivalent.
- Request rate limits/idempotency protection as needed.

## Gameplay Work
- Start with Common–Legendary rarity framework.
- Enable duplicate machines.
- Add partial resale value.
- Add 2–3 meaningful capacity purchases beyond starting capacity.

## UI/UX Work
- Roll button and cost
- Roll result presentation
- Compact inventory
- Rarity/readable effect info
- Sell confirmation
- Capacity upgrade display

## Art / Audio / Asset Requirements
- Rarity frames/icons
- Simple roll reveal
- Coin feedback
- Inventory machine thumbnails/placeholders

## Dependencies
Placement system and machine definitions from Phases 1–2.

## Analytics / Instrumentation
- Roll purchased
- Rarity result
- Machine granted
- Machine sold
- Coins spent/earned
- Capacity purchased
- Time to first roll

## Security / Exploit Considerations
- Never accept client-selected roll result.
- Validate cost before grant.
- Prevent negative inventory.
- Prevent replayed sell/upgrade requests.

## Performance Considerations
- Inventory UI virtualizes only if actually needed; launch inventory is small.
- Avoid excessive roll animation replication.

## Automated Validation
- Weighted table validation
- Transaction conservation tests
- Negative/overflow tests
- Inventory add/remove tests
- Capacity permission tests

## Manual Validation
- Roll pacing
- Inventory comprehension
- Resale frustration
- Capacity-vs-roll choice
- mobile inventory usability

## Scope Classification
### Required Now
- Coins
- rolls
- inventory
- resale
- capacity
### Valuable Later
- choice-of-three
- rerolls
- pity system
- filters
### Scope Creep
- gems
- tickets
- paid luck
- trading

## Explicitly Out of Scope
- Prestige
- social economy
- multiple roll currencies
- player marketplace

## Completion Definition
Phase is complete when production Coins can safely and understandably cycle through rolls, inventory decisions, placement, resale, and limited expansion with no trivial exploit path.
