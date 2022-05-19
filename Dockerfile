ARG BUILDX_VERSION
ARG DOCKER_VERSION
ARG TARGETOS
ARG TARGETARCH

FROM alpine AS fetcher

RUN apk add curl

ENV BUILDX_VERSION="${BUILDX_VERSION:-0.8.2}"
ENV DOCKER_VERSION="${DOCKER_VERSION:-latest}"
ENV TARGETOS="${TARGETOS:-linux}"
ENV TARGETARCH="${TARGETARCH:-amd64}"
RUN curl -L \
  --output /docker-buildx \
  "https://github.com/docker/buildx/releases/download/v${BUILDX_VERSION}/buildx-v${BUILDX_VERSION}.${TARGETOS}-${TARGETARCH}"

RUN chmod a+x /docker-buildx

ARG DOCKER_VERSION
FROM docker:${DOCKER_VERSION}

COPY --from=fetcher /docker-buildx /usr/lib/docker/cli-plugins/docker-buildx
