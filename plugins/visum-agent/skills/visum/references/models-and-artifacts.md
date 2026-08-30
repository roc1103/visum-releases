# Models and artifacts

## Model roles

- **Visum Lux:** remembers labelled visual identities and retrieves visually similar items. User teaching produces a cumulative Lux Reference Pack while the official encoder remains unchanged.
- **Visum Vexillum:** finds and describes interface elements within a larger image.
- **Visum Peritus:** follows structured element observations through time. It normally receives Vexillum output rather than raw images.
- **Visum Procurator:** coordinates compatible unchanged models and routing inside a solution.
- **Visum Confector:** enacts permissioned, target-bound computer actions selected through a coordinated bundle.
- **Visum Ultra:** deferred and unavailable in the current executable release.

## File roles

- `.visumproject`: persistent editable work for one visual solution. It may use multiple model roles.
- `.visumset`: immutable prepared training, validation, and locked-test data.
- `.visumpack`: one independently identifiable trained model, official base model, or Lux Reference Pack, including contracts, evidence, rights, lineage, provenance, and integrity records.
- `.visumbundle`: a deterministic team of unchanged Model Packs plus Procurator routing, compatibility, governance, and optional Confector policy.
- `.visum`: portable runnable and editable solution containing the coordinated bundle, its project, datasets, and training-compatible model weights.

## Choosing the path

Use Lux for recognising taught items, Vexillum for finding elements on a full interface, and Peritus for temporal state or change. A realistic application can use all three through one `.visumproject`; the user should not need to train or package them independently unless they want direct control.

Do not call `.visumset` a model, `.visumpack` a dataset, or `.visum` a merged model. Procurator bundles models without fusing their weights.

Use `visum model validate`, `visum dataset validate`, `visum bundle validate`, or `visum document validate` before trusting an artifact. Use `visum library list --json` to discover installed models instead of guessing paths or identities.
