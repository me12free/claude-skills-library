I need to integrate $ARGUMENTS.

Before writing a single line of code:

1. Web-search the official documentation and fetch the primary docs page.
   Confirm the URL is from the official domain (not a mirror, blog, or third party).
2. Fetch and read the full authentication section. Note:
   - Auth method (OAuth2, API key, HMAC signature, etc.)
   - Token lifetime and refresh strategy
   - Sandbox vs production credential differences
3. Fetch and read the specific endpoint(s) for {{what you need to do}}.
   Note exact field names, types, required vs optional, and enum values.
4. Fetch and read the webhook/callback section if applicable.
   Note signature verification method, header name, and hashing algorithm.
5. Fetch the error code reference. Map provider error codes to internal error types.
6. Check for known breaking changes, deprecations, or versioning notes.

After completing research, produce:

**Integration Summary**
| Item | Value |
|------|-------|
| Auth method | |
| Base URL (sandbox) | |
| Base URL (production) | |
| Signature algorithm | |
| Webhook header | |
| Token TTL | |

**Security requirements**
- List every credential needed, the env var name, and how it is scoped
- List signature verification steps in order - must be constant-time
- List any IP allowlist requirements

**Verified endpoint table**
| Method | Path | Auth | Purpose |
|--------|------|------|---------|
| | | | |

**Error mapping**
| Provider code | Meaning | Internal action |
|---------------|---------|-----------------|
| | | |

**Risks and gotchas**
- List any undocumented behaviour found in official changelogs or migration guides
- List any sandbox vs production behaviour differences

Only then implement. If documentation is ambiguous on a security-critical point,
flag it explicitly rather than assuming.
