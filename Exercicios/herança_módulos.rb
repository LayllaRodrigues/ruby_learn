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

# Quando criamos criamos uma classe que herda comportamento de outra, utili- zamos o caractere <. 
#Definimos, por exemplo, que a classe Livro < Midia herda todos os comportamentos existentes na classe Midia e em todas as superclasses também.

# As classes Livro e DVD definem um método acessor para o atributo valor e um método de leitura para o atributo titulo.
# Quando invocamos o método attr_reader :titulo estamos definindo um método titulo para os objetos da classe Livro e DVD, no caso do método attr_acessor :valor definimos dois métodos: valor e valor=(novo_valor). Já que este código está sendo repetido, vamos extraí-lo para dentro da classe Midia e assim as classes Livro e DVD as herdarão:


class Midia
    attr_accessor :valor
    attr_reader :titulo
end
# coding: utf-8
class DVD < Midia
    def initialize(titulo, valor, categoria)
        @titulo = titulo
        @valor = valor
        @categoria = categoria
end
    def to_s
        %Q{ Título: #{@titulo}, Valor: #{@valor} }
end end
# coding: utf-8
class Livro < Midia
    attr_reader :categoria, :autor
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

teste_e_design = Livro.new "TDD", "Mauricio Aniche", "123454", 247,69.9, :testes
p teste_e_design.valor # => 69.9
p teste_e_design.titulo # => "TDD"
windows = DVD.new "Windows 7 for Dummies", 98.9, :sistemas_operacionais
p windows.valor # => 98.9
p windows.titulo # => Windows 7 for Dummies


# Herança e variáveis de instância:

# As mídias da nossa loja virtual possuem um desconto particular de cada uma de- las que é aplicado ao seu valor. 
#No método initialize da classe Livro va- mos definir uma variável de instância que guardará o valor do desconto, e faremos o mesmo no método initialize da classe DVD. Após isso definiremos um mé- todo valor_com_desconto diretamente na classe Midia, já que este será um comportamento padrão as duas mídias existentes:

class Midia
    attr_accessor :valor
    attr_reader :titulo
    def valor_com_desconto
        @valor - (@valor * @desconto)
end end
# coding: utf-8
class DVD < Midia
    def initialize(titulo, valor, categoria)
        @titulo = titulo
        @valor = valor
        @categoria = categoria
        @desconto = 0.1
    end

    def to_s
        %Q{ Título: #{@titulo}, Valor: #{@valor} }
    end 

end

# coding: utf-8
class Livro < Midia
    attr_reader :categoria, :autor

    def initialize(titulo, autor, isbn = "1", numero_de_paginas,
        valor, categoria)
        @titulo = titulo
        @autor = autor
        @isbn = isbn
        @numero_de_paginas = numero_de_paginas
        @categoria = categoria
        @valor = valor
        @desconto = 0.15
    end
    
    def to_s
        "Autor: #{@autor}, Isbn: #{@isbn},
        Páginas: #{@numero_de_paginas},
        Categoria: #{@categoria}"
    end 
end

teste_e_design = Livro.new "TDD", "Mauricio Aniche", "123454", 247,69.9, :testes
p teste_e_design.valor_com_desconto # => 59.41
windows = DVD.new "Windows 7 for Dummies", 98.9, :sistemas_operacionais
p windows.valor_com_desconto # => 89.01


# O método valor_com_desconto existe nas instâncias de Livro e DVD como esperado. Porém existe algo interessante no código acima: o método valor_com_desconto acessa duas variáveis de instância, @valor e @desconto,
# que estão definidas nas subclasses. Em outras linguagens este comportamento não funcionaria, exceto se as variáveis estivessem também definidas na classe Midia.
# Este comportamento é bastante particular da linguagem Ruby, quando falamos de variáveis de instância e herança. Você vai entender isso melhor nas próximas linhas.
# As classes Livro e DVD assim como outras mídias que surgirão, terão um valor de desconto pré-definido em 10%. Sendo assim, vamos criar uma variável de ins- tância chamada @desconto dentro da classe Midia e inicializá-lo com o valor 0.1:


class Midia
    attr_accessor :valor
    attr_reader :titulo

    def initialize
        @desconto = 0.1
    end

    def valor_com_desconto
        @valor - (@valor * @desconto)
    end 
end

# Podemos assim, eliminar a variável @desconto da classe DVD:

class DVD < Midia
    def initialize(titulo, valor, categoria)
        @titulo = titulo
        @valor = valor
        @categoria = categoria
    end

    def to_s
        %Q{ Título: #{@titulo}, Valor: #{@valor} }
    end 
end





