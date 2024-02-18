include .env

################ Docker commands ################

# ребилд без глобальных изменений
build:
	docker-compose build
# создание образа с нуля
rebuild:
	docker-compose build --no-cache
# создать контейнер
up:
	docker-compose up -d
# выключить контейнер
down:
	docker-compose down
# первичная настройка
setup:
	docker-compose run --rm app /usr/bin/zsh -c "python3.11 main.py"
