cmd				:=	$(shell which docker-compose >/dev/null; RETVAL=$$?; if [ $$RETVAL -eq 0 ]; then echo 'docker-compose'; else echo 'docker compose'; fi)
file				:=	-f ./srcs/docker-compose.yml

re-up: down up

logs:
	${cmd} ${file} logs --follow


up:
	mkdir -p ./data/
	mkdir -p ./data/mariadb
	mkdir -p ./data/wordpress
	${cmd} ${file} up --build -d

down:
	${cmd} ${file} down

clean: down
	docker builder prune --all -f
	docker system prune -a -f --volumes

fclean: clean
	-docker volume rm wordpress
	-docker volume rm mariadb
	sudo rm -rf ./data/

info:
	docker system df