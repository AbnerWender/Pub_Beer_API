# Makefile for config and run the Rails API

APP_NAME = Pub_API
DB_NAME = app_development
TEST_DB_NAME = app_test
RAILS_ENV = development


.PHONY: help
help:
	@echo "Available commands:"
	@echo "  make build       - Install dependencies and start Docker containers."
	@echo "  make down        - Stop and remove Docker containers."
	@echo "  make start       - Start Docker containers and the Rails server."
	@echo "  make stop        - Stop Docker containers and the Rails server."
	@echo "  make restart     - Restart Rails server."
	@echo "  make help        - Display this help message."
	@echo ""
	@echo "Note: Ensure that Docker is running and that you have the necessary permissions."

.PHONY: build
build:
	bundle install
	docker-compose up -d
	@echo "Docker initializing in the background"

.PHONY: down
down:
	docker-compose down
	@echo "Docker removed!"

.PHONY: start
start:
	@echo  "----------------------"
	docker-compose start
	@echo "Docker started!"
	@echo  "----------------------"
	rails server -b 0.0.0.0 -p 3000 -d
	@echo "Rails server started!"
	@echo "========================================"
	@echo "Access the API at http://localhost:3000"
	@echo "========================================"

.PHONY: stop
stop:
	docker-compose stop
	chmod +x kill.py
	python3 kill.py
	@echo "===================="
	@echo "Docker stopped!"
	@echo "Rails server stopped!"
	@echo "===================="

.PHONY: restart
restart:
	chmod +x kill.py
	python3 kill.py
	rails server -d
	@echo "===================="
	@echo "Server restarted!"
	@echo "===================="
