# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    make                                               :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: melkholy <melkholy@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/12 23:36:04 by melkholy          #+#    #+#              #
#    Updated: 2024/02/12 23:53:13 by melkholy         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CONFIG_FILES = requirements/wordpress/Dockerfile \
			requirements/wordpress/tools/install_configure_wp.sh \
			requirements/mariadb/Dockerfile \
			requirements/mariadb/tools/setting_up_mariadb.sh \
			requirements/mariadb/conf/50-server.cnf \
			requirements/nginx/Dockerfile \
			requirements/nginx/tools/setting_up_nginx.sh \
			requirements/nginx/conf/melkholy.42.fr \
      docker-compose.yaml


all: up

up: build
	@docker compose up -d

build: $(CONFIG_FILES)
	@docker compose build

down:
	@docker compose down

kill:
	@docker compose stop -t 0

clean: kill
	@docker images -q | xargs docker rmi
	@docker volume ls -q | xargs docker volume rm

fclean: clean
	@docker system prune
	@cd ~/data/wp_data && rm -rf *
	@cd ~/data/db_data && rm -rf *
	@cd ~/inception/srcs/

re: clean fclean
.PHONY: all up build down kill clean fclean re
