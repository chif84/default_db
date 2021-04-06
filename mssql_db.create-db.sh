#Запуск скрипта создания БД и схемы БД
#Повторяем это в цикле, потому что время готовности экземпляра SQL не определено
echo "Waiting 30 seconds before creating DB"
sleep 30
echo "Run creating DB"
for i in {1..50};
do
    /opt/mssql-tools/bin/sqlcmd -S $MSSQL_DB_HOST -U sa -P $MSSQL_SA_PASSWORD -i mssql_db.create-db.sql -v dbName="$MSSQL_DB_NAME"
    if [ $? -eq 0 ]
    then
        echo "Creating DB completed"
        break
    else
        echo "not ready yet..."
        sleep 1
    fi
done