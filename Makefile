UID:=$(shell id -u)
GID:=$(shell id -g)

build:
	docker-compose build
up:
	docker-compose up -d
down:
	docker-compose down
cli:
	docker-compose exec rails-dummy_app /bin/zsh
rsanb:
	docker-compose exec rails-dummy_app rails console --sandbox
