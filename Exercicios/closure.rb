
# Quando criamos um bloco de código (lambda, proc ou bloco convencional) ele pos- sui acesso às variáveis visíveis do escopo onde foram criados, e qualquer alteração nestas variáveis serão refletidas no escopo original, ou seja, os blocos possuem uma espécie de link com as variáveis definidas no escopo de origem. Por exemplo:

soma = 0
[1, 3, 5, 6, 9].each do |numero|
    soma += numero
end

p soma

# Repare que o bloco de código que definimos e passamos na chamada ao método
# each possui acesso a variável soma que foi definida no escopo onde o bloco foi
# criado. Esta capacidade de fazer bind com as variáveis que foram definidas no escopo onde o bloco foi criado é conhecido com closure.

# Este comportamento pode ser confirmado ao executarmos o seguinte exemplo:

def imprime_numero
    numero = 134
    yield 
end

def chama_metodo_imprime_numero
    numero = 42
    imprime_numero do
        puts "O número aqui é: #{numero}"
    end 
end

chama_metodo_imprime_numero

# O número impresso é 42 porque no escopo onde o bloco foi criado a variável numero possui o valor 42. No contexto onde o bloco foi invocado existe um outra variável numero com o valor 134, porém esta segunda variável foi definida no contexto do método imprime_numero e não é visível ao bloco.