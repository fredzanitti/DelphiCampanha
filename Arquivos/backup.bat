@echo off
color 17
rem imprimi mensagem na tela
title INICIANDO BACKUP, AGUARDE...

echo.
echo Verificando diretorios...
echo.
ping -n 3 127.0.0.1 > nul

D:
cd D:\Backup\Campanha Ano a Ano
md BackupCampanha
cd BackupCampanha
md Escudos
md Jogadores

echo.
echo Copiando arquivos... Escudos
echo.
ping -n 3 127.0.0.1 > nul

xcopy /S /E /Y "C:\Program Files\Campanha Ano a Ano\Seu Time\DBAcompanhamento\Escudos\*.*" "D:\Backup\Campanha Ano a Ano\BackupCampanha\Escudos\" 

echo.
echo Copiando arquivos... Jogadores
echo.
ping -n 3 127.0.0.1 > nul

xcopy /S /E /Y "C:\Program Files\Campanha Ano a Ano\Seu Time\DBAcompanhamento\Jogadores\*.*" "D:\Backup\Campanha Ano a Ano\BackupCampanha\Jogadores\" 

echo.
echo Realizando backup do banco de dados...
echo.
ping -n 3 127.0.0.1 > nul

cd D:\Projetos em Delphi\Campanha Ano a Ano - Delphi XE7\Arquivos
mysqldump --lock-tables --hex-blob -h localhost -u root -proot zanittic_software > "D:\Backup\Campanha Ano a Ano\BackupCampanha\bkp%date:~0,2%_%date:~3,2%_%date:~6,10%.sql"

echo.
echo.
title BACKUP REALIZADO COM SUCESSO
echo BACKUP REALIZADO COM SUCESSO
echo.
echo.
pause