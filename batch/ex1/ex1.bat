@echo off
mode 62,12
color 02
:inicio
cls
echo.
echo                  #========================#
echo                  #     MENU PRINCIPAL     #
echo                  #1 Relatorio em arquivo  #
echo                  #S Sair                  #
echo                  #========================#
echo. 
echo.

choice /c 1s /t 10 /d s  /m "Escolha uma opcao:" 

if %errorlevel%==2 goto :sair
if %errorlevel%==1 goto :relat

:relat
echo ================================================================================================= >> relatorio1.txt
echo. >> relatorio1.txt
date /t >> relatorio1.txt
time /t >> relatorio1.txt
echo. >> relatorio1.txt
ipconfig /all >> relatorio1.txt
echo. >> relatorio1.txt
echo Versao do Sistema Operacional em uso: >> relatorio1.txt
ver >> relatorio1.txt
echo. >> relatorio1.txt
echo Informacoes sobre a raiz: >> relatorio1.txt
dir c: /w >> relatorio1.txt
echo. >> relatorio1.txt
echo Portas TCP e UDP em uso: >> relatorio1.txt
netstat -a >> relatorio1.txt
echo. >> relatorio1.txt
echo Tabela de roteamento: >> relatorio1.txt
netstat -r >> relatorio1.txt
echo. >> relatorio1.txt
echo Processos em memoria: >> relatorio1.txt
tasklist >> relatorio1.txt
echo. >> relatorio1.txt
echo. >> relatorio1.txt
timeout /t 5
goto inicio

:sair
echo Fim do script.
timeout /t 3

