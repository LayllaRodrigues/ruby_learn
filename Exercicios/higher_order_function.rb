# Funções ou métodos são high-order quando tem a capacidade de receber outras fun- ções como argumentos ou retornar funções como resultado. Em Ruby isto é feito usando blocos, lambdas e procs.
# Blocos, lambdas e procs são um dos aspectos mais poderoso da linguagem Ruby, e também um dos que causam mais confusões para serem entendidos, isso porque Ruby possui quatro maneiras de lidar com high-order functions.

#Blocos
# Este é o método mais comum trabalhar com funções high-order em Ruby. Os blocos são muito utilizados e comuns quando percorremos coleções:

numeros = [1, 2, 3, 4]
numeros.each { |numero| p numero }

# Mas o que está acontecendo nesse código afinal?
# A primeira e mais importante parte que devemos entender, está na chamada ao método each que fizemos na variável numeros. Ao invocarmos o método, estamos passando uma função ou bloco de código como argumento. Internamente o método each itera o Array, executa o bloco de código recebido como argumento passando o valor da iteração (neste caso a variável numero). O bloco de código que recebe a variável numero está imprimindo a mesma no console utilizando o método p.
# Existem outros métodos da classe Array que recebem um bloco de código como argumento e o executam a cada iteração. Por exemplo, o método collect:

numeros = [1, 2, 3, 4]
numeros_ao_quadrado = numeros.collect { |numero| numero ** 2 }
p numeros_ao_quadrado # => [1, 4, 9, 16]

# Existem vários outros método bastante úteis na API dos arrays, você deve sempre consultá-la para não reimplementar comportamentos que já existem. Lembre-se que um dos principais atrativos da linguagem Ruby é a sua legibilidade, conhecer bem a API da linguagem é um dos passos mais importantes para conseguir tal vantagem.