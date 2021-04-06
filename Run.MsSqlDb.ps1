# Сборка образа mssql_db

#Чтение параметров
$values = Get-Content ".\.env" | Out-String | ConvertFrom-StringData
$SQL_DATA_FOLDER = ".\" + $values.MSSQL_DATA_FOLDER

if ( !$values.MSSQL_SA_PASSWORD )
{
    Write-Output "MSSQL_SA_PASSWORD can't be null. Check value in file .env"
	Exit
}

# Создание папки для файлов БД (если не существует)
if (![System.IO.Directory]::Exists($SQL_DATA_FOLDER ))
{
     New-Item -ItemType Directory -Force -Path $SQL_DATA_FOLDER
}

& docker-compose -p $values.PROJECT_NAME build --force-rm --no-cache mssql_db

if ($LASTEXITCODE -ne 0) {
    Write-Error -Message "Build failed" -ErrorAction Stop 
}

& docker-compose -p $values.PROJECT_NAME up --remove-orphans -d mssql_db