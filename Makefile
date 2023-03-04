DOCKER_FILE     := -f docker-compose.yml
DOCKER_APP_EXEC := docker-compose ${DOCKER_FILE} exec
init: ## Initial build the container and starting them
	docker-compose ${DOCKER_FILE} up --build -d

up:
	docker-compose ${DOCKER_FILE} up -d

down: ## remove the containers
	docker-compose ${DOCKER_FILE} down

restart: ## Restart the container
	make down
	make up

migrate:
	${DOCKER_APP_EXEC} app php artisan migrate

site-up:
	${DOCKER_APP_EXEC} app php artisan up

site-down:
	${DOCKER_APP_EXEC} app php artisan down