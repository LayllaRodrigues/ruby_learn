#encouding: utf-8

class Livro 

    attr_accessor :valor
    attr_reader :categoria

    def initialize(autor,isbn = '1',numero_de_páginas,valor,categoria)
        @autor = autor
        @numero_de_páginas = numero_de_páginas
        @isbn = isbn
        @valor = valor
        @categoria = categoria
    end

    def to_s
        "Autor: #{@autor}, Isbn: #{@isbn}, Páginas: #{@numero_de_páginas}, Categoria: #{@categoria}, Valor: #{@valor}"
    end
end

teste_e_design = Livro.new "Laylla", 234, 90, :testes
qualidade_de_software = Livro.new "Julio", 232, 95, :qualidade_de_software

# teste_e_design.valor=79.9 #mudando valor do preço
# qualidade_de_software.valor=900

# puts teste_e_design
# puts qualidade_de_software

#exemplo invocando o metodo com accessor 
# puts teste_e_design.preço
#nesse topico, sobrescrevemos o metodo to_s e invocamos ele atraves do metodo put 

# o metodo instance_variable_set e instance_variable_get permite ler e alterar o valor das variaveis de instancia
# teste_e_design.instance_variable_set "@valor", 78
# puts teste_e_design.preço

#Se precisarmos acessar quais são os livros que existem dentro da nossa biblioteca,
# basta expor a variável @livros através do attr_reader:

class Biblioteca 
    attr_accessor :livros

    def initialize
        @livros = {} #Inicializa com um hash
    end

    def adiciona(livro)
        @livros[livro.categoria] ||= []
        @livros[livro.categoria] << livro
    end

    def livros
        @livros.values.flatten #Criando nossa própria implementação do método livros, conseguimos manter o mesmo comportamento anterior, quando retornávamos um array diretamente
    #SOBRE:
    #Quando precisamos obter todos os valores de um determinado hash, independente do container, utilizamos o método values (que retorna todos os valores do hash dentro de um Array)
    end

    def livros_por_categoria(categoria)
        @livros[categoria].each do |livro|
            yield livro if block_given?
        end

        # O método block_given? verifica se algum bloco foi passado como argumento na chamada do método e retorna um valor booleano. Em nosso exemplo, caso algum bloco seja passado, o executamos, caso contrário o método yield não será invocado.
    end
end

biblioteca = Biblioteca.new

teste_e_design = Livro.new "Mauricio Aniche", "123454", 247, 70.5, :teste
web_design_responsivo = Livro.new "Tárcio Zemel", "452565", 189, 67.9, :web_design

biblioteca.livros_por_categoria :testes do |livro|
    p livro.autor
end

# Quando executamos o método livros_por_categoria passamos um Symbol :testes que representa a categoria de livros que desejamos filtrar e tam- bém um bloco de código que recebe na variável livro declarada dentro dos carac- teres || cada um dos objetos existentes para a categoria filtrad

hash = {"123454" => web_design_responsivo , 
        "452565" => web_design_responsivo}

# puts hash["123454"]

biblioteca.adiciona teste_e_design
biblioteca.adiciona web_design_responsivo

# puts biblioteca.livros

biblioteca = Biblioteca.new

for categoria, livros in biblioteca.livros do
    p categoria

    for livro in livros do
        p livro.valor
    end
end

puts teste_e_design.categoria
puts teste_e_design.valor

