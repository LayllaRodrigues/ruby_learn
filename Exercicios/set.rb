require 'set'

#reproduzindo numeros sem duplicatas em hash

numero_sem_repeticao = Set.new [1, 2, 2, 3, 2, 1]

for numero in numero_sem_repeticao do
    p numero 
end
