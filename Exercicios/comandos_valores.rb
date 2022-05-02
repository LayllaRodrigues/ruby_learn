# Comandos que retornam valores
# Literais, chamada de métodos, variáveis, estruturas de controle, todos estes coman- dos são avaliados como expressões pelo interpretador Ruby. Vamos tomar como exemplo o caso onde desejamos atribuir um determinado valor a uma variável se uma condição for verdadeira e outro valor caso a condição seja falsa. Podemos criar esse código em Ruby da seguinte maneira:


valor = nil
numero = "dois"

if numero == "um" then valor = 1
elsif numero == "dois" then valor = 2
else valor = 3
end

p valor # => 2

# Porém o código acima pode ficar mais legível se aproveitarmos o poder da lin-
# guagem Ruby de avaliar tudo como uma expressão:

numero = "dois"
valor = if numero == "um" then 1
            elsif numero == "dois" then 2
else 3 end
p valor # => 2

# Até mesmo quando utilizamos um for, o seu resultado é uma expressão. Se percorrermos um Array com três elementos usando um for e multiplicarmos cada item por 2, por exemplo, podemos atribuir seu resultado a uma variável:

numeros = [1, 2, 3, 4]
novos_numeros = for n in numeros
n*2 end
p novos_numeros # => [1, 2, 3, 4]

