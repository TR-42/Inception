COMPOSE_FILE=./srcs/docker-compose.yaml
COMPOSE_CMD=docker compose -f $(COMPOSE_FILE)

all: up
up:
	${COMPOSE_CMD} up -d

down:
	${COMPOSE_CMD} down

ps:
	${COMPOSE_CMD} ps

clean:
	${COMPOSE_CMD} down -v

fclean:
	${COMPOSE_CMD} down -v --rmi local

re: fclean up

.PHONY: up down ps clean fclean re
