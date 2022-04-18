# coding: utf-8
# - Método map com notação simplificada:  retornar um Array com o resultado do bloco aplicado para cada elemento recebido.
# - Simplificando uso do método inject: O método “inject” é um Redutor: ele pega linha a linha do Array e repassa ao bloco, como primeiro parâmetro. O segundo parâmetro, 'buf', é um totalizador que é iniciado com o primeiro parâmetro que passamos no método 'inject', no caso a string vazia "". Ele repassa sempre esse objeto como segundo parâmetro do bloco

class Livro
    attr_accessor :valor
    attr_reader :categoria, :autor, :titulo

    def initialize(titulo, autor, isbn = "1", numero_de_paginas, valor, categoria)
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
    def eql?(outro_livro)
        @isbn == outro_livro.isbn
    end
    
    def hash
        @isbn.hash
    end 
end

class Relatorio
    def initialize(biblioteca)
        @biblioteca = biblioteca
    end
    def total
        @biblioteca.livros.inject(0) { |tot, livro| tot += livro.valor }
    end

    #O método map itera sobre um Array, e para cada elemento (neste caso um objeto Livro) executa um bloco de código passado como argumento. O resultado da execução deste bloco, é guardado dentro de um Array acumulador, que é re- tornado no final da iteração de todos os livros.
    
    def titulos
        @biblioteca.livros.map &:titulo
        #A expressão &:titulo cria um bloco como este:{ |livro|livro.titulo }.O character & invoca um método to_proc no objeto, e passa este bloco para o método map.
    end

end

soma

class Relatorio
    def total
        @biblioteca.livros.map(&:valor).inject(:+)
    end
end

biblioteca = Biblioteca.new
biblioteca.adiciona Livro.new "TDD", "Mauricio Aniche", "123454",247, 69.9, :testes
biblioteca.adiciona Livro.new "Design Responsivo", "Tárcio Zemel","45256", 189, 69.9, :web_design
relatorio = Relatorio.new biblioteca

p relatorio.titulos 