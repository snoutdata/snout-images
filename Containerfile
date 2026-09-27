# snout-images: imgproxy, unmodified, pinned by digest, with SnoutData Cloud's defaults.
# No image code of ours is in this image: see README.md.
#
#   docker build -f Containerfile -t snout-images .
#
# The digest is the multi-architecture index, so one pin covers amd64 and arm64 (the fleet).
FROM docker.io/darthsim/imgproxy:v3.30.1@sha256:3b709e4a0e5e8e0e959b556b7031229202b4b8e7e7d955c517ea7abed68ee34d

LABEL org.opencontainers.image.title="snout-images" \
	org.opencontainers.image.description="imgproxy v3.30.1, unmodified, with SnoutData Cloud's defaults. All image processing is imgproxy's and libvips'." \
	org.opencontainers.image.base.name="docker.io/darthsim/imgproxy:v3.30.1" \
	org.opencontainers.image.licenses="MIT AND LGPL-2.1-or-later AND Apache-2.0"

# The defaults the fleet already set on imgproxy directly. Every one is imgproxy's own variable,
# and a value given to the container overrides it.
ENV IMGPROXY_USE_ETAG=true \
	IMGPROXY_ENABLE_WEBP_DETECTION=true
