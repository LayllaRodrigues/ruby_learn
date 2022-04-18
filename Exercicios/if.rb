#Uma das vantagens do ruby é o syntax sugar que visa deixar o codigo mais legivel 
#sem parentese

idade = 27
nome = "Lucas"

if idade > 18
    puts nome 
end 

#Se o corpo do if possuir apenas uma linha, podemos usar uma sintaxe mais enxuta

puts nome if idade > 18 

