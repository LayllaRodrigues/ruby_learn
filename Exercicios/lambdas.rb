
# Existe outra maneira de guardar um bloco de código em uma variável e passá- lo como argumento na chamada de um método, são os lambdas, que são conhecidos também como funções anônimas:

biblioteca = Biblioteca.new
biblioteca.adiciona Livro.new "TDD", "Mauricio Aniche", "123454",247, 69.9, :testes

imprime_livro_no_console = lambda do |livro|
    p livro.autor
end

biblioteca.livros_por_categoria :testes, &imprime_livro_no_console

# Os lambdas se parecem muito com procs, entretanto, existem duas diferenças. A primeira é que quando utilizamos lambdas, ao contrário das procs, existe uma checagem da quantidade de parâmetros passados:

biblioteca = Biblioteca.new
biblioteca.adiciona Livro.new "TDD", "Mauricio Aniche", "123454",247, :testes

imprime_livro_no_console = lambda do
    p 'executou lambda'
end

imprime_livro_no_console_proc = Proc.new do
    p 'executou proc'
end

biblioteca.livros_por_categoria :testes, &imprime_livro_no_console_proc


# Quando invocamos o método livros_por_categoria passando um objeto do tipo Proc, na invocação do bloco nenhum argumento é esperado, mas mesmo assim o p colocado é executado. Quando o bloco passado é do tipo Lambda, acon- teceumerro: ArgumentErrorinformandoqueoblocodeveriaesperarpelomenos 1 argumento, entretanto nenhum foi declarado.
# A segunda diferença acontece quando utilizamos return dentro de um lambda. Quando declaramos um return dentro de um lambda, o método que invocou o bloco receberá o retorno deste bloco e continuará com sua execução nor- malmente. Se utilizarmos um return dentro de uma proc o método que invocou o bloco será interrompido e seu retorno será o valor retornado na execução da mesma.
# Vamos ver um pequeno exemplo para deixar as coisas mais claras:

def proc_com_return
    Proc.new { return "retornando algo de uma proc" }.call
    "Proc finalizada"
  end

  def lambda_com_return
    lambda { return "retornando algo de um lambda" }.call
    "Lambda finalizado"
  end
  
  puts proc_com_return
  puts lambda_com_return