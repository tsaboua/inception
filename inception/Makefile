all:
	@sudo docker compose -f ./srcs/docker-compose.yml up

down:
	@sudo docker compose -f ./srcs/docker-compose.yml down
	-sudo docker rmi $$(docker images -a -q) -f
	docker system prune -a --volumes -f
	docker volume prune -f
	docker container prune -f


stop:
	@sudo docker compose -f ./srcs/docker-compose.yml stop

re:
	@make down
	@make all