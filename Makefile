name = inception
containers= $(shell docker ps -aq)
all:
	@printf "Launch configuration ${name}...\n"
	@mkdir -p /home/rchahban/data/mariadb
	@mkdir -p /home/rchahban/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up -d

build:
	@printf "Building configuration ${name}...\n"
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@printf "Stopping configuration ${name}...\n"
	@docker compose -f ./srcs/docker-compose.yml down

clean: down
	@printf "Cleaning configuration ${name}...\n"
	@docker system prune -af

fclean:
	@printf "Total clean of all configurations docker\n"
	@if  [ -z "$(containers)" ]; then echo "no containers to delete" ; else  docker container rm -f $(containers) ;fi
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf /home/rchahban/data/*
	@sudo rm -rf /home/rchahban/data


re: fclean all
	@printf "Rebuild configuration ${name}...\n"

.PHONY : all build down re clean fclean
