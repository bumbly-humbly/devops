# AI instructions for this repository

## PlantUML diagrams

When asked to create or update a diagram for this project, use PlantUML. Store
source files in `docs/diagrams/` with descriptive names and the `.puml` extension.
Update an existing relevant diagram instead of creating a duplicate.

Before editing, review the request, existing diagrams, and relevant project files:

- `frontend/`: HTML, JavaScript, CSS, the Nginx configuration, and Docker image.
- `k8s/`: Deployment, Service, Gateway, HTTPRoute, HPA, and deployment script.
- `kind/`: local cluster configuration and creation script.
- `frontend.sh` and `README.md`: supporting commands and project context.

Use repository configuration as the source of truth. Tools listed in the README
do not by themselves prove that infrastructure or integrations are implemented.
Distinguish configured resources from resources actually applied by scripts;
do not claim a diagram represents a verified running cluster without evidence.
If resource references disagree, show or note the discrepancy rather than
silently depicting the intended connection as working. Do not change application
code or infrastructure solely to make a diagram consistent.

Choose the diagram type that fits the request: deployment or component diagrams
for infrastructure, sequence diagrams for request flows, and activity diagrams
for build or deployment workflows. For architecture diagrams, inspect the actual
request path through Gateway/HTTPRoute, Service, and Nginx frontend pods, along
with cluster boundaries, ports, selectors, replicas, and scaling references when
relevant. Show traffic separately from configuration or management relationships.

Requirements:

- Enclose each diagram in `@startuml` and `@enduml`.
- Use clear labels, stable aliases, consistent naming, and a readable layout.
- Preserve relevant existing elements and styling when updating a diagram.
- Represent relationships and flow directions accurately; include only details
  supported by the request or project files.
- Prefer self-contained source without remote includes.
- Ask for clarification only when missing information materially affects the
  diagram; otherwise state reasonable assumptions and proceed.
- Validate syntax and render with an available PlantUML renderer. If none is
  available, review the source and explicitly report that rendering was not
  verified. Do not install tooling unless requested or already authorized.
- If producing a rendered artifact, keep its matching `.puml` source alongside it.
- Link new documentation diagrams from `README.md` when useful for discovery.

After completing the work, identify the created or updated files, briefly explain
the diagram or changes, and report validation results and relevant assumptions.
When file access is unavailable, return the complete PlantUML source instead.
