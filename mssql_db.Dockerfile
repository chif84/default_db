FROM mcr.microsoft.com/mssql/server:latest

# Переключение на root
USER root

# Создание папки приложения
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app

# Фикс символов переноса строк
RUN sed -i 's/\r//' /usr/src/app/mssql_db.create-db.sh

# Переключение на mssql
USER mssql

# Запуск конечных точек
ENTRYPOINT /bin/bash ./mssql_db.entrypoint.sh