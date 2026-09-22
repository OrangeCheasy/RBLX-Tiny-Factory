# Tiny Factory assets

`src/assets` maps to `ReplicatedStorage.Assets`. Use PascalCase folders and descriptive asset names.

- `Models/3D`: machine, item, plot, and environment source assets organized by role.
- `Models/2D`: factory, machine, and item concept/modeling references.
- `Images/Homepage`: icons and thumbnails.
- `Images/UI`: interface assets when needed.

Phase 1 uses simple generated/placeholder geometry: a producer, a processor, a
seller, a path, and a cube-like item. Adding an asset does not automatically
replace placeholder geometry; the machine definition and runtime must remain
valid without optional art.

Prioritize readable silhouettes, clear item transformations, simple collision
proxies, and a low-noise visual language. Final machine and environment art is
v1 polish work after the deterministic simulation is proven.
