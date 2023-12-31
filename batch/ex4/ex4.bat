@echo off
Rem isto é um comentário
mode 80,40
color 02
:inicio
cls
echo                  #============================#
echo                  #    MENU PRINCIPAL          #
echo                  #1 Versao do Windows         #
echo                  #2 Informacoes Raiz          #
echo                  #3 Portas TCP/UDP abertas    #
echo                  #4 Tabela de roteamento      #
echo                  #5 Processos em memoria      #
echo                  #6 relatorio em arquivo      #
echo                  #7 informacoes de rede       #
echo                  #S Sair                      #
echo                  #============================#

echo. 
echo.
choice /c 1234567s /t 10 /d s  /m "Escolha uma opcao.:" 
if %errorlevel%==8 goto :sair
if %errorlevel%==7 goto :rede
if %errorlevel%==6 goto :relat
if %errorlevel%==5 goto :proc
if %errorlevel%==4 goto :rota
if %errorlevel%==3 goto :portas
if %errorlevel%==2 goto :raiz
if %errorlevel%==1 goto :versao

:rede
cls
ipconfig /all
timeout /t 5
goto inicio

:versao
cls
echo Versao do Sistema Operacional em uso
ver
timeout /t 5
goto inicio

:raiz
cls
echo Informacoes sobre a raiz
dir c: /w
timeout /t 5
goto inicio

:portas
cls
echo Portas TCP e UDP em uso
netstat -a
timeout /t 5
goto inicio

:rota
cls
echo Tabela de roteamento
netstat -r
timeout /t 5
goto inicio

:proc
cls
echo Processos em memoria
tasklist
timeout /t 5
goto inicio

:relat
call relat.bat
timeout /t 5
goto inicio

:sair
echo fim de script
timeout /t 3

