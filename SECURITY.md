# Security

snout-images is imgproxy and libvips, unmodified (README.md). Where a report should go depends on
where the problem is:

- **In imgproxy, libvips or a codec library** (a crafted image that crashes or escapes the decoder,
  for example): report it to that project, following its own security policy. We take its fix by
  moving the pinned version, and ship that to SnoutData Cloud first.
- **In this packaging** (the Containerfile, the defaults it sets, the version it pins), or in how
  SnoutData Cloud runs it: report it privately to us, never as a public issue:
  - a [private security advisory](../../security/advisories/new) on this repository, or
  - email **security@snoutdata.com**.

The disclosure policy is [snoutdata/.github SECURITY.md](https://github.com/snoutdata/.github/blob/main/SECURITY.md)
(also linked from [snoutdata.com/.well-known/security.txt](https://snoutdata.com/.well-known/security.txt)).

Only the latest release is supported. When unsure which of the two it is, send it to us and we will
pass it on.
