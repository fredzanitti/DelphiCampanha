@echo off
color 17
title PREPARANDO BANCO DE DADOS, AGUARDE...
echo.
echo Preparando a base de dados...
echo.
ping -n 3 127.0.0.1 > nul
C:
C:
cd C:\Program Files\Campanha Ano a Ano\Seu Time\DBAcompanhamento\backup\
mysql -u root -proot -e "drop database zanittic_software"
mysql -u root -proot -e "create database zanittic_software"
mysql -u root -proot zanittic_software < "C:\Program Files\Campanha Ano a Ano\Seu Time\DBAcompanhamento\Backup\reset.sql"
echo.
echo.
title BASE DE DADOS PREPARADA COM SUCESSO
echo BASE DE DADOS PREPARADA COM SUCESSO
echo.
echo.
exit