# Funções Úteis
## O que há neste repositório?
Aqui temos uma série de arquivos com funções que são úteis no dia-a-dia de pesquisa no MADE. Para utilizar as funções, basta adicionar source(caminho_do_arquivo) no início de seu código.
## Arquivos
### funcao_despesa.R
Neste arquivo há somente uma função, criar_coluna_despesa, que tem como objetivo criar uma base com os identificadores relevantes da POF 17/18(COD_UPA, COD_INFORMANTE, NUM_UC, etc.) e uma coluna com a despesa agregada com os códigos de produtos escolhidos. É necessário instalar a biblioteca rlang para utilizar esta função.
Arguentos da função:
- base: A base de despesa individual ou coletiva.
- produtos: Uma lista dos códigos de produtos a serem incluídos na coluna
- nome_coluna: Nome da coluna de despesa a ser criada
- individual: Uma variável que indica se estamos calculando os dados na base de despesa individual ou coletiva.
- morador: A base morador da POF, para per-capitalização das despesas no caso de utilização da base de despesa coleitva.
### IneqFunctions.R
Neste arquivo, há várias funções relevantes para o estudo de desigualdade de renda. É necessário instalar as bibliotecas hutils e tidyverse para utilizar as funções deste arquivo. As funções são:
#### StatsGini
Retorna o índice de gini para uma dada distribuição. Argumentos:
- x: Vetor contendo a distribuição de renda, capital, riqueza, etc.
- w: Vetor de pesos(por padrão, ele é um vetor de 1s)
#### Top_Aprop
Retorna a apropriação dos top x% de uma determinada distribuição. Argumentos:
- x: Vetor contendo a distribuição de renda, capital, riqueza, etc.
- w: Vetor de pesos(por padrão, ele é um vetor de 1s)
- centile: Centil de corte.
#### Bottom_Aprop
Retorna a apropriação dos x% da cauda inferior de uma determinada distribuição. Argumentos:
- x: Vetor contendo a distribuição de renda, capital, riqueza, etc.
- w: Vetor de pesos(por padrão, ele é um vetor de 1s)
- centile: Centil de corte.