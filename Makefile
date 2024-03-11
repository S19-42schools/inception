up:
	@mkdir -p ~/data
	@mkdir -p ~/data/mariadb
	@mkdir -p ~/data/wordpress
	@docker-compose -f srcs/docker-compose.yml up --build -d

down:
	@docker-compose -f srcs/docker-compose.yml down

clean:
	@docker stop $$(docker ps -qa)
	@docker rm $$(docker ps -qa)
	@docker rmi $$(docker images -qa)
	@docker volume rm $$(docker volume ls -q)
	@docker network rm $$(docker network ls -q)

re: clean up

.PHONY: up down clean re
