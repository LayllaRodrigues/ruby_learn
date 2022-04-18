#Vamos criar um método que filtra os livros por uma determinada categoria, itera cada um destes livros e executa um bloco de código que será passado para este método. Nosso primeiro passo será criar o método dentro da classe Biblioteca:

class Biblioteca
    def initialize
        @livros = {} # Inicializa com um hash
    end
    def adiciona(livro)
        @livros[livro.categoria] ||= []
        @livros[livro.categoria] << livro
    end
    def livros
        @livros.values.flatten
    end
    def livros_por_categoria(categoria)
        @livros[categoria].each do |livro|
            #O método livros_por_categoria espera que um bloco de código seja pas- sado como argumento. Porém, se este bloco for utilizado internamente, mas não for passado como argumento, ocorrerá um erro informando que este método deveria ter sido informado
            yield livro if  block_given?
        end
    end
end

#O método block_given? verifica se algum bloco foi passado como argumento na chamada do método e retorna um valor booleano. Em nosso exemplo, caso al- gum bloco seja passado, o executamos, caso contrário o método yield não será invocado.


