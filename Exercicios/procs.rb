# Procs
# Na seção anterior executamos blocos de código através do método yield. Uma se- gunda maneira é recebermos o bloco de código como um argumento do tipo Proc. Vamos ver o código e depois discutiremos as diferenças:

class Biblioteca
    def initialize
        @livros = {} # Inicializa com um hash
    end
    def adiciona(livro)
        @livros[livro.categoria] ||= []
        @livros[livro.categoria] << livro
    end
    def livros
        @livros.values.flaten
    end
    def livros_por_categoria(categoria, &bloco)
        @livros[categoria].each do |livro|
            bloco.call livro
        end
    end 
end

biblioteca = Biblioteca.new
biblioteca.adiciona Livro.new "TDD", "Mauricio Aniche", "123454",247, 69.9, :testes
biblioteca.adiciona Livro.new "Design Responsivo", "Tárcio Zemel","45256", 189, 69.9, :web_design

biblioteca.livros_por_categoria :testes do |livro|
    p livro.autor
end


# O código é bastante parecido, porém possui duas importantes diferenças. A primeira é que passamos um argumento chamado &bloco para o método livros_por_categoria. O caractere & indica que estamos recebendo uma ins- tância de Proc que na realidade é o bloco de código que vamos executar. A se- gunda diferença é que não invoca-se o bloco de código chamando o método yield, agora invocamos o método call no argumento recebido na declaração do método ( bloco).
# O que ainda não fica muito claro é por que usaríamos uma Proc ao invés de um simples yield?
# As vezes precisamos executar o mesmo bloco de código várias vezes, um objeto do tipo Proc guarda um bloco de código, e pode ser passado como parâmetro várias vezes para efetuar a chamada de um mesmo método, por exemplo:

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
            yield livro if block_given?
        end
    end 
end

biblioteca = Biblioteca.new
biblioteca.adiciona Livro.new "TDD", "Mauricio Aniche", "123454",247, 69.9, :testes

imprime_livro_no_console = Proc.new do |livro|
    p livro.autor
end

biblioteca.livros_por_categoria :testes, imprime_livro_no_console

# O que fizemos foi definir um objeto Proc na variável imprime_livro_no_console que guarda o bloco de código que havíamos criado anteriormente, com isso podemos passá-lo para qualquer método que recebe um bloco como argumento.
# O único problema é que o código acima não funciona, e a mensagem de erro pa- rece bem estranha. Ela nos diz que estamos invocando um método que deve receber um argumento passando dois. Isso que dizer que o bloco não conta como argumento do método?
# Exatamente. O método livros_por_categoria recebe apenas um argu- mento explícito chamado categoria o outro é um bloco, que como na antiga implementação, não precisa necessariamente ser passado. Mas isso ainda não ex- plica o erro retornado, afinal, tudo bem que o bloco pode ser ou não passado, mas no meu exemplo eu desejo passá-lo.
# O que acontece é que a variável imprime_livro_no_console que está aguar- dando a Proc que foi criada é um objeto, ou seja, quando invocamos o método livros_por_categoria passando o objeto imprime_livro_no_console como argumento, é como se estivéssemos passando qualquer outro argumento na chamada. Porém, sabemos que o método recebe apenas um argumento, obrigatori- amente.
# O que precisamos fazer é transformar o objeto do tipo Proc imprime_livro_no_console em um bloco convencional e passar este bloco como argumento na chamada do método. Essa transformação é feita utilizando o caractere &:

biblioteca = Biblioteca.new
biblioteca.adiciona Livro.new "TDD", "Mauricio Aniche", "123454",247, 69.9, :testes

imprime_livro_no_console = Proc.new do |livro|
    p livro.autor
end

# transforma objeto proc em um bloco convencional
biblioteca.livros_por_categoria :testes, &imprime_livro_no_console

# Ao adicionar o caractere & antes da variável que guarda o bloco que desejamos passar como argumento para o método livros_por_categoria, ele será auto- maticamente ‘convertido’ para um bloco convencional novamente.
# Desta maneira, o método livros_por_categoria continua recebendo e exe- cutando um bloco através da chamada ao método yield. A vantagem é que o bloco em um objeto do tipo Proc pode ser reutilizado em outras partes do código.

# Recebendo dois blocos como argumento
# Caso seja necessário em algum momento, receber dois blocos como argumento de um método, a utilização do yield torna-se obsoleta, já que não seria possível descobrir qual dos dois blocos deveria ser executado.
# Neste caso, a solução é receber explicitamente os dois blocos como argumentos do método. Porém, como objetos do tipo Proc e não blocos convencionais:
    
class Biblioteca
    def livros_por_categoria(categoria, bloco_com_p, bloco_com_puts)
        @livros[categoria].each do |livro|
            # Sem o &, transformamos o bloco em um objeto novamente
            bloco_com_p.call livro
            bloco_com_puts.call livro
        end 
    end
end

biblioteca = Biblioteca.new
biblioteca.adiciona Livro.new "TDD", "Mauricio Aniche", "123454",247, 69.9, :testes

imprime_livro_no_console = Proc.new do |livro|
    p livro.autor
end

imprime_livro_no_console_com_puts = Proc.new do |livro|
    puts livro.autor
end

biblioteca.livros_por_categoria :testes,
    imprime_livro_no_console,
    imprime_livro_no_console_com_puts
