# Existem varias formas de iterar um determinado numero de vezes por um cod ruby.
#exemplo: desejamos imprimir os numeros de 1 ate 100. Apenas adicionando uma uma mensagem "numero X" para deixarmos nossas msg mais elegantes.

for numero in (1..100)
    puts "Numero: #{numero}"
end

#posso interar de 1 até 100 imprimindo cada um dos numeros utilizando a estrutura de repeticao while, pois ele ira executar ate que a condicao seja falsa 

numero = 0
while numero <= 100
    puts "Numero: #{numero}"
    numero += 1
end

#Until: ao contrario do while, o until executa um bloco de codigo ate que uma condicao seja vedadeira

numero = 0 
until numero == 101
    puts "Numero: #{numero}"
    numero += 1
end 