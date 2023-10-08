export DOCKER_BUILDKIT=1

COMPOSE=docker compose -f docker-compose.yml

up:	## Run project containers with compose
	$(COMPOSE) up

down:	## Stop project containers with compose
	$(COMPOSE) down --timeout 0