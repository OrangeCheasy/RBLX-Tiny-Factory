# Tank Blast assets

`src/assets` maps to `ReplicatedStorage.Assets`. Use PascalCase folders and descriptive asset names.

- `Models/3D`: tank and environment source assets organized by role.
- `Models/2D`: tank concept/modeling references.
- `Images/Homepage`: icons and thumbnails.
- `Images/UI`: interface assets when needed.

The current player tank, Phase 4 enemy tanks, and levels are generated graybox geometry. Phase 4 enemies are built by EnemyFactory from EnemyRegistry definitions and converted into the active level's objective models; there is no BombFactory or lane-sorting asset lookup. Adding an asset does not automatically replace generated geometry.

Use GDD phase files 08 and 12–13 for the canonical art direction and asset prompts. Prioritize top silhouettes from the 30-degree-from-vertical gameplay camera. Separate moving turret/barrel components and retain simple collision proxies. Final enemy/player art remains a later polish pass; Phase 4 should prove reusable combat behavior before replacing graybox silhouettes.
