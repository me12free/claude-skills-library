Audit the dependencies of $ARGUMENTS for security and maintenance risk.

Steps:
1. Read requirements.txt / pyproject.toml / package.json (whichever applies)
2. Web-search each direct dependency for:
   - Known CVEs in the pinned version
   - Whether the package is actively maintained (last release date)
   - Whether a major version bump introduces breaking changes

Produce:

**Dependency risk table**
| Package | Pinned version | Latest | CVEs | Maintained | Action |
|---------|---------------|--------|------|------------|--------|
| | | | | | UPGRADE / MONITOR / REPLACE / OK |

**Immediate actions (do now)**
- Packages with known CVEs in the pinned version
- Packages with no release in 24+ months that are in the critical path

**Planned actions (next sprint)**
- Outdated but not critical

**Unpinned dependencies**
- List any dependency without a pinned version — these are a supply-chain risk
- Recommend pinning strategy

Output the full table first, then the action sections.
