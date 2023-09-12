.PHONY: help build build-local up down logs ps test
.DEFAULT_GOAL := help

DOCKER_TAG := latest
# コマンドの前はTABのみ可
build:
	docker build -t gumamon/gotodo:${DOCKER_TAG} --target deploy ./
build-local:
	docker compose build --no-cache

up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs -f

ps:
	docker compose ps

test:
	go test -trace -shuffln=on ./...

help:
	echo "hello make."
