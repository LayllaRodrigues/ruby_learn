#Arrays em ruby sao colecoes indexadas, ou seja, guardam objetos em uma determinada ordem e disponibilizam metodos que permitem acessar objetos 
#em uma determinada ordem. 

#quando precisamos acessar o primeiro ou o ultimo elemento, usamos o first e last 

numeros = [1,2,3] 
numeros << "hi"
puts numeros.first


#como ruby é dinamico, podemos adc objetos atravez do metodo <<

#existe uma sintaxe mais simples para criar um array de palavras:

nome = "Lucas"
palavras = %W{ola #{nome}}
p palavras 
# A vantagem de usar %W é poder separar as palavras que compoe o array utilizando espaço e não virgula, assim poluindo pouco o código.