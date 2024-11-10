ifneq ($(shell docker compose version 2>/dev/null),)
	DOCKER_COMPOSE := docker compose
else
	DOCKER_COMPOSE := docker-compose
endif

build:
	$(DOCKER_COMPOSE) build --no-cache

up:
	$(DOCKER_COMPOSE) up -d --build nginx

down:
	$(DOCKER_COMPOSE) down

clean:
	$(DOCKER_COMPOSE) down --rmi all --volumes --remove-orphans

logs:
	$(DOCKER_COMPOSE) logs -f

install:
	$(DOCKER_COMPOSE) run --rm composer install
	$(DOCKER_COMPOSE) run --rm npm i

migrate:
	$(DOCKER_COMPOSE) run --rm artisan migrate

seed:
	$(DOCKER_COMPOSE) run --rm artisan migrate:fresh --seed

dev:
	$(DOCKER_COMPOSE) run --rm --service-ports npm run dev

prod:
	$(DOCKER_COMPOSE) run --rm npm run build

test:
	$(DOCKER_COMPOSE) run --rm artisan test

.PHONY: build up down clean logs install migrate seed dev prod test
