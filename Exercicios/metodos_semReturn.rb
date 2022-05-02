
# Todos os métodos Ruby retornam sempre o resultado da última expressão de- clarada, por esse motivo, você não precisa explicitamente adicionar o return no final de cada método:

def boas_vindas(nome)
    "Bem vindo: #{nome}"
end
p boas_vindas("Lucas") # => "Bem vindo: Lucas"

# Quando invocado o método boas_vindas retornará a String interpolada
# com o valor do argumento nome que foi passado.

