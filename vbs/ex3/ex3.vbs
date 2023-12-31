Dim inteiro(24)
Set arquivo = CreateObject( "Scripting.FileSystemObject" )
Set arquivo = arquivo.CreateTextFile( "saida.cvs", True )



Function contPares
	Dim total
	
	total = 0

	For i = 0 to 24
		If inteiro(i) MOD 2 = 0 Then
			total = total + 1
		end If
	next
	
	WScript.Echo "Quantidade de pares: " & total
	arquivo.Write "Quantidade de pares: " & total & ";"
end Function

Function contImpares
	Dim total
	
	total = 0

	For i = 0 to 24
		If inteiro(i) MOD 2 > 0 Then
			total = total + 1
		end If
	next
	
	WScript.Echo "Quantidade de impares: " & total
	arquivo.Write "Quantidade de impares: " & total & ";"
end Function

Function media
	Dim total
	Dim m
	
	total = 0

	For i = 0 to 24
		total = total + inteiro(i)
	next
	
	m = total / 25
	
	WScript.Echo "Media dos numeros: " & m
	arquivo.Write "Media dos numeros: " & m & ";"
end Function

Function maior
	Dim m
	
	m = inteiro(0)

	For i = 0 to 24
		If inteiro(i) > m Then
			m = inteiro(i)
		end If
	next
	
	WScript.Echo "Maior numero: " & m
	arquivo.Write "Maior numero: " & m & ";"
end Function

Function menor
	Dim m
	
	m = inteiro(0)

	For i = 0 to 24
		If inteiro(i) > m Then
			m = inteiro(i)
		end If
	next
	
	WScript.Echo "Menor numero: " & m
	arquivo.Write "Menor numero: " & m & ";"
end Function

Function soma
	Dim total
	
	total = 0

	For i = 0 to 24
		total = total + inteiro(i)
	next
	
	WScript.Echo "Soma dos numeros: " & total
	arquivo.Write "Soma dos numeros: " & total & ";"
end Function

Function temNegativo
	Dim tem
	
	tem = False
	
	For i = 0 to 24
		If inteiro(i) < 0 Then
			tem = True
		end If
	next
	
	If tem Then
		WScript.Echo "Ha negativos"
		arquivo.Write "Ha negativos" & ";"
	Else
		WScript.Echo "Nao ha negativos"
		arquivo.Write "Nao ha negativos" & ";"
	end If
end Function



For i = 0 to 24
	inteiro(i) = InputBox ( "Insira um numero inteiro: " )
next


contPares()
contImpares()
media()
maior()
menor()
soma()
temNegativo()

arquivo.Close
