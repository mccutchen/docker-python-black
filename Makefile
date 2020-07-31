.PHONY: image imagepush

DOCKER_TAG  ?= $(shell awk '/^ENV BLACK_VERSION/ {print $$NF}' Dockerfile)
DOCKER_REPO ?= mccutchen/python-black

image:
	docker build -t $(DOCKER_REPO):$(DOCKER_TAG) -t $(DOCKER_REPO):latest .

imagepush: image
	docker push $(DOCKER_REPO):$(DOCKER_TAG)
	docker push $(DOCKER_REPO):latest
