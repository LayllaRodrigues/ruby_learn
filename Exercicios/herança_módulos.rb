# Uma das principais característica de um bom design de código é a eliminação de duplicidades desnecessárias. 
# O princípio DRY (Don’t Repeat Yourself) criado por Andy Hunt e Dave Thomas, no excelente livro “The Pragmatic Programmer”, propõe que cada pequena quantidade de código deve possuir somente uma representação em todo o sistema.

#Herança Simples:
# Em Ruby podemos fazer com que uma classe herde apenas de uma única outra classe, o que caracteriza o que chamamos de Herança Sim- ples.

# p Livro.superclass.methods # => [..., :inspect, ...]

# Listando os métodos de uma classe:
# O método methods retorna todos os métodos disponíveis para os objetos que são criados a partir da classe ou de subclasses. 
#Podemos por exemplo, listar os métodos da classe Object e assim concluirmos que ela disponibiliza o método inspect para os objetos do tipo Livro, já que Livro herda de Object.

# Vamos começar a lidar com outros objetos em nossa loja virtual. 
#Agora vamos criar DVD’s, e já conseguimos pensar em abstrações para estas duas classes, por exemplo, todo Livro e DVD possuem um titulo, valor e uma categoria.
#Portanto vamos criar uma classe Midia, que ficará dentro do arquivo lib/midia.rb, e que também será a superclasse das classes Livro e DVD, que também não foi criada e deve ser adicionada no arquivo lib/dvd.rb:

class Midia
end
# coding: utf-8
class DVD < Midia
    attr_accessor :valor
    attr_reader :titulo
    
    def initialize(titulo, valor, categoria)
        @titulo = titulo
        @valor = valor
        @categoria = categoria
    end

    def to_s
        %Q{ Título: #{@titulo}, Valor: #{@valor} }
    end 
end
# coding: utf-8
class Livro < Midia
    attr_accessor :valor
    attr_reader :categoria, :autor, :titulo
    def initialize(titulo, autor, isbn = "1", numero_de_paginas,
                                              valor, categoria)
        @titulo = titulo
        @autor = autor
        @isbn = isbn
        @numero_de_paginas = numero_de_paginas
        @categoria = categoria
        @valor = valor
    end
    def to_s
        "Autor: #{@autor}, Isbn: #{@isbn},
            Páginas: #{@numero_de_paginas},
            Categoria: #{@categoria}"
    end 
end

