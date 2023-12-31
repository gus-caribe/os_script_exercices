@echo off
mode 96,13
color 02

:pre
if not exist relatorios\ (
	mkdir relatorios
)

:inicio
cls
echo.
echo                  #==========================================================#
echo                  #                      MENU PRINCIPAL                      #
echo                  #1) Salvar lista de usuarios do equipamento e seus papeis. #
echo                  #2) Salvar Lista de Diretorios contidos na raiz.           #
echo                  #3) Salvar a lista de processos em execucao no momento.    #
echo                  #4) Gerar um relatorio CSV.                                #
echo                  #5) Desligar o equipamento.                                #
echo                  #==========================================================#
echo. 
echo.

choice /c 12345 /m "Escolha uma opcao:" 

if %errorlevel%==1 goto :usuarios
if %errorlevel%==2 goto :diretoriosraiz
if %errorlevel%==3 goto :processos
if %errorlevel%==4 goto :csv
if %errorlevel%==5 goto :desligar

:usuarios
echo ================================================= >> .\relatorios\%COMPUTERNAME%-userslist.txt
date /t >> .\relatorios\%COMPUTERNAME%-userslist.txt
time /t >> .\relatorios\%COMPUTERNAME%-userslist.txt
echo. >> .\relatorios\%COMPUTERNAME%-userslist.txt
net user >> .\relatorios\%COMPUTERNAME%-userslist.txt
echo. >> .\relatorios\%COMPUTERNAME%-userslist.txt
echo. >> .\relatorios\%COMPUTERNAME%-userslist.txt
goto inicio

:diretoriosraiz
cd %SystemDrive%
echo ================================================= >> .\relatorios\%COMPUTERNAME%-dirlist.txt
date /t >> .\relatorios\%COMPUTERNAME%-dirlist.txt
time /t >> .\relatorios\%COMPUTERNAME%-dirlist.txt
echo. >> .\relatorios\%COMPUTERNAME%-dirlist.txt
dir /s >> .\relatorios\%COMPUTERNAME%-dirlist.txt
echo. >> .\relatorios\%COMPUTERNAME%-dirlist.txt
echo. >> .\relatorios\%COMPUTERNAME%-dirlist.txt
goto inicio

:processos
echo ================================================= >> .\relatorios\%COMPUTERNAME%-pslist.txt
date /t >> .\relatorios\%COMPUTERNAME%-pslist.txt
time /t >> .\relatorios\%COMPUTERNAME%-pslist.txt
echo. >> .\relatorios\%COMPUTERNAME%-pslist.txt
tasklist >> .\relatorios\%COMPUTERNAME%-pslist.txt
echo. >> .\relatorios\%COMPUTERNAME%-pslist.txt
echo. >> .\relatorios\%COMPUTERNAME%-pslist.txt
goto inicio

:csv
echo %COMPUTERNAME%;%LOGONSERVER%;%USERNAME%;%SystemDrive%;%PROCESSOR_IDENTIFIER%;%PROCESSOR_ARCHITECTURE%;%NUMBER_OF_PROCESSORS%;%WINDIR% >> .\computadores.csv
goto inicio

:desligar
shutdown /s
goto inicio