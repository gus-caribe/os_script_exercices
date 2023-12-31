@echo off

mode 108,20

color 02

:inicio
cls
echo.
echo                  #======================================================================#
echo                  #                            MENU PRINCIPAL                            #
echo                  #1 Salvar lista de todos os arquivos da unidade C em arquivo           #
echo                  #2 Salvar uma lista de todos os arquivos ocultos do sistema            #
echo                  #3 Exibir o dia da semana por extenso                                  #
echo                  #4 Fazer backup das pastas Downloads e Documentos em uma pasta oculta  #
echo                  #5 Iniciar Wordpad                                                     #
echo                  #6 Exibir Meus Documentos em forma grafica                             #
echo                  #7 Sair                                                                #
echo                  #======================================================================#
echo. 
echo.
choice /c 1234567 /t 10 /d 7  /m "Escolha uma opcao:" 

if %errorlevel%==1 goto :arquivoc
if %errorlevel%==2 goto :arquivooculto
if %errorlevel%==3 goto :diasemana
if %errorlevel%==4 goto :backup
if %errorlevel%==5 goto :wordpad
if %errorlevel%==6 goto :meusdocumentos
if %errorlevel%==7 goto :sair

:arquivoc
dir C:\*.* > arquivoC.txt
echo Inserido em arquivoC.txt.
timeout /t 3
goto inicio

:arquivooculto
dir C:\ /A:H /S > arquivosOcultos.txt
echo Inserido em arquivosOcultos.txt.
timeout /t 3
goto inicio

:diasemana
g++ main.c -o main.exe
start /wait main.exe
echo.
if %errorlevel%==48 echo Domingo
if %errorlevel%==49 echo Segunda-feira
if %errorlevel%==50 echo Terca-feira
if %errorlevel%==51 echo Quarta-feira
if %errorlevel%==52 echo Quinta-feira
if %errorlevel%==53 echo Sexta-feira
if %errorlevel%==54 echo Sabado
timeout /t 5
goto inicio

:backup
if not exist backup\ (
	mkdir backup
	attrib +h backup /d
)
xcopy /s /i /y %HOMEDRIVE%\%HOMEPATH%\Documents backup
xcopy /s /i /y %HOMEDRIVE%\%HOMEPATH%\Downloads backup
timeout /t 3
goto inicio

:wordpad
start wordpad.exe
timeout /t 3
goto inicio

:meusdocumentos
start %HOMEDRIVE%\%HOMEPATH%\Documents
timeout /t 3
goto inicio

:sair
echo Fim do script.
timeout /t 3

