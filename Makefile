COMPOSE_FILE=./srcs/docker-compose.yml
COMPOSE_CMD=docker compose -f $(COMPOSE_FILE)

all: up
bonus: up
up:
	@sh ./setup_mntdir.sh
	${COMPOSE_CMD} up -d
upb:
	@sh ./setup_mntdir.sh
	${COMPOSE_CMD} up -d --build

down:
	${COMPOSE_CMD} down

start:
	${COMPOSE_CMD} start
stop:
	${COMPOSE_CMD} stop

ps:
	${COMPOSE_CMD} ps

logs:
	${COMPOSE_CMD} logs $(s)
sh:
	${COMPOSE_CMD} exec -it $(s) sh

clean:
	${COMPOSE_CMD} down -v
	@sh ./rm_mntdir.sh

fclean:
	${COMPOSE_CMD} down -v --rmi local

build:
	${COMPOSE_CMD} build

setup:
	@if [ ! -f "./srcs/.env" ]; then echo "ERROR: Place '.env' before build!" >&2; exit 1; fi

	@sh ./setup_mntdir.sh
	@sh ./srcs/requirements/nginx/files/ssl/gen-key.sh
	@sh ./srcs/requirements/wordpress/files/download_cache/download.sh ./srcs/.env

	@make build

re: fclean up

.PHONY: up down ps clean fclean re
