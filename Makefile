.PHONY: all create-networks remove-networks up down clean help

DOCKER_COMPOSE_FILES := \
	mysql/docker-compose.yml \
	planka/docker-compose.yml \
	postgres/docker-compose.yml \
	redis/docker-compose.yml \
	redisinside/docker-compose.yml

all: help

create-networks:
	@echo "Criando redes Docker..."
	docker network create databases-net || true
	docker network create server-net || true
	@echo "Redes Docker criadas."

remove-networks:
	@echo "Removendo redes Docker..."
	docker network rm databases-net || true
	docker network rm server-net || true
	@echo "Redes Docker removidas."

up: create-networks
	@echo "Iniciando serviços Docker Compose..."
	docker compose -f $(DOCKER_COMPOSE_FILES) up -d
	@echo "Serviços Docker Compose iniciados."

down:
	@echo "Parando e removendo serviços Docker Compose..."
	docker compose -f $(DOCKER_COMPOSE_FILES) down
	@echo "Serviços Docker Compose parados e removidos."

clean: down remove-networks
	@echo "Removendo volumes Docker..."
	docker volume rm $(shell docker volume ls -qf "name=mysql_data|name=planka_favicons|name=planka_user-avatars|name=planka_background-images|name=planka_attachments|name=postgres_data|name=redis_data|name=redisinsight_data") || true
	@echo "Volumes Docker removidos."

help:
	@echo "Uso: make [comando]"
	@echo ""
	@echo "Comandos:"
	@echo "  create-networks   Cria as redes Docker necessárias."
	@echo "  remove-networks   Remove as redes Docker."
	@echo "  up                Inicia todos os serviços Docker Compose em modo detached."
	@echo "  down              Para e remove todos os serviços Docker Compose."
	@echo "  clean             Para e remove serviços, redes e volumes Docker."
	@echo "  help              Exibe esta mensagem de ajuda."