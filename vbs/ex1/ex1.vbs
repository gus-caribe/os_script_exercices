Function calculoJuros( ByVal cap, ByVal jur, ByVal per )
    WScript.Echo "Capital + juros simples: " & capital + periodo * capital * ( juros / 100 )
end Function

capital = InputBox( "Insira o valor do capital: " )
juros = InputBox( "Insira a porcentagem de juros: " )
periodo = InputBox( "Insira o periodo mensal: " )

Call calculoJuros( capital, juros, periodo )
