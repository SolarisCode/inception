# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: melkholy <melkholy@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/12 23:36:04 by melkholy          #+#    #+#              #
#    Updated: 2024/02/14 19:52:22 by melkholy         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CONFIG_FILES = srcs/requirements/wordpress/Dockerfile \
			srcs/requirements/wordpress/tools/install_configure_wp.sh \
			srcs/requirements/mariadb/Dockerfile \
			srcs/requirements/mariadb/tools/setting_up_mariadb.sh \
			srcs/requirements/mariadb/conf/50-server.cnf \
			srcs/requirements/nginx/Dockerfile \
			srcs/requirements/nginx/tools/setting_up_nginx.sh \
			srcs/requirements/nginx/conf/melkholy.42.fr \
			srcs/docker-compose.yaml



all: up

up: build
	@docker compose -f ./srcs/docker-compose.yaml up -d

build: $(CONFIG_FILES)
	@docker compose -f ./srcs/docker-compose.yaml build

status:
	@docker compose -f ./srcs/docker-compose.yaml ps

down:
	@docker compose -f ./srcs/docker-compose.yaml down

kill:
	@docker compose -f ./srcs/docker-compose.yaml stop -t 0

clean: kill down
	@docker images -q | xargs docker rmi
	@docker volume ls -q | xargs docker volume rm

rm:
	@cd ~/data/wp_data && sudo rm -rf *
	@cd ~/data/db_data && sudo rm -rf *
	@cd ~/inception/srcs/

fclean: 
	@docker system prune

re: clean fclean
.PHONY: all up build status down kill clean rm fclean re
