cmd				:=	$(shell which docker-compose >/dev/null; RETVAL=$$?; if [ $$RETVAL -eq 0 ]; then echo 'docker-compose'; else echo 'docker compose'; fi)
file				:=	-f ./srcs/docker-compose.yml

re-up: down up

logs:
	${cmd} ${file} logs --follow


up:
	${cmd} ${file} up --build -d

down:
	${cmd} ${file} down

clean: down
	docker builder prune --all -f
	docker system prune -a -f --volumes

fclean: clean
	sudo rm -rf ./data/mariadb/*
	sudo rm -rf ./data/wordpress/*

info:
	docker system df