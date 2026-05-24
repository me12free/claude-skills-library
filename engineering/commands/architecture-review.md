You are a Principal Software Architect. I need a senior-level target architecture document
for $ARGUMENTS.

Source document: {{path to architecture spec or describe it inline}}

Read the source document fully. While reading it, also explore the current codebase to
understand what already exists. Then produce a complete architecture document saved as
`{{output_filename}}.md` that covers:

1. Executive summary
2. Assumptions (list anything inferred, with rationale)
3. Current state review — what exists, what the gaps are
4. Target architecture — all services, their boundaries, and responsibilities
5. A Mermaid diagram showing: all services, external integrations, communication flows
   (sync vs async), data ownership, and trust boundaries
6. Communication patterns — sync REST table, async event table, inter-service auth
7. Integration patterns — one section per external system
8. Deployment and environment strategy
9. Data flow and ownership
10. Security — secrets management, trust boundaries, credential isolation, auditability
11. Observability — logging schema, key metrics, alerting thresholds
12. Scalability and failure handling — per-service scaling axis, failure scenarios
13. Phased implementation plan
14. Risks, tradeoffs, and alternatives considered

Rules:
- Do not invent details not supported by the document or codebase — state assumptions explicitly
- No repo file paths in the document — architecture only
- No implementation steps — architecture only
- Mermaid diagram must be readable and production-quality
