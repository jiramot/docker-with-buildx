.PHONY: build
BUILDX_VERSION=0.8.2
DOCKER_VERSION=latest


createx:
	docker buildx create --use
buildx:	
	docker buildx build --build-arg BUILDX_VERSION=$(BUILDX_VERSION) --build-arg DOCKER_VERSION=$(DOCKER_VERSION) --platform linux/amd64 -t dockerx .
