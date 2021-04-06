# Скрипты проекта развертывания дефолтных баз данных для ELMA в докере #

Набор скриптов для быстрого развертывания контейнеров БД готовых для старта ELMA.

## MsSql ##
Перед запуском заполните рараметр MSSQL_SA_PASSWORD в файле `.env` 

Для развертывания БД MsSql с базой ELMA4 созданной по умолчанию запустите скрипт `Run.MsSqlDb.ps1`

Для запуска ELMA используйте строку подключения, указав в ней свой пароль
`Data Source=localhost;Initial Catalog=ELMA4;Integrated Security=false;User ID=sa;Password=`