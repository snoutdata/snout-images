# snout-images

**This is a wrapper, not an image processor.** snout-images runs
[imgproxy](https://github.com/imgproxy/imgproxy) (MIT, by Sergey Alexandrovich) exactly as its
authors publish it. Every resize, crop, quality change and format conversion is imgproxy's, done by
[libvips](https://github.com/libvips/libvips) (LGPL-2.1-or-later) and the codec libraries in
imgproxy's own image. None of that code is ours, and we do not change it.

We are not image specialists. Decoding untrusted images is a hard problem with a large attack
surface, and imgproxy is mature and maintained, so we track its releases rather than write a decoder
of our own.

## What the wrapper adds

Only packaging, so the rest of SnoutData Cloud can treat it as one of its own services:

- **Our name.** The host's service catalogue and the rest of the stack refer to `snout-images`, so
  the service keeps its name when the upstream version moves.
- **The upstream version, pinned by digest**: `darthsim/imgproxy:v3.30.1@sha256:3b709e4a…` in the
  [Containerfile](./Containerfile), so a rebuild cannot pick up a different imgproxy.
- **Our defaults, built in**: `IMGPROXY_USE_ETAG=true` and `IMGPROXY_ENABLE_WEBP_DETECTION=true`,
  the values the fleet already set on imgproxy directly.

Every setting is still imgproxy's own `IMGPROXY_*` environment variable, passed through untouched,
and a value given to the container overrides a default above. The options are documented at
[docs.imgproxy.net](https://docs.imgproxy.net/configuration/options).

## Build and run

```sh
docker build -f Containerfile -t snout-images .
docker run --rm -p 8080:8080 snout-images
```

It listens where imgproxy does (`:8080`) and answers imgproxy's own `/health`. For production, set
`IMGPROXY_KEY` and `IMGPROXY_SALT` so only signed URLs are rendered.

## Moving to a new imgproxy

Change the tag and digest on the `FROM` line (`docker buildx imagetools inspect
darthsim/imgproxy:<tag>` prints the index digest), rebuild, compare rendered output before and after,
and bump this package's version.

## Licences

- imgproxy: MIT.
- libvips: LGPL-2.1-or-later.
- The codec libraries: each under its own licence, as shipped in imgproxy's image.
- This repository's own files (the Containerfile and its documentation): Apache-2.0 (LICENSE,
  NOTICE).

Security reports: SECURITY.md.
