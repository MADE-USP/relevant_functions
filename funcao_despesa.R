library(rlang)
criar_coluna_despesa <- function(base, produtos, individual, nome_coluna, morador = NULL){
  base <- base %>% rename(cod_upa = COD_UPA, num_dom = NUM_DOM, num_uc = NUM_UC, uf = UF)
  # Mensalizando o valor na base de despesa individual e filtrando para somente despesas monetárias
  base$V9011[is.na(base$V9011)] <- 1
  base$V8000_DEFLA <- (base$V8000_DEFLA * base$V9011 * base$FATOR_ANUALIZACAO)/12
  base <- base %>% filter(V9002 <= 6)
  # Filtrando para os gastos relacionados ao produto informado
  base <- base %>% filter(V9001 %in% produtos)
  if(individual){
    base <- base %>% rename(cod_informante = COD_INFORMANTE)
    base <- base %>% group_by(cod_upa, num_dom, num_uc, cod_informante) %>% summarise(!! sym(nome_coluna) := sum(V8000_DEFLA))
    base <- base %>% select(cod_upa, num_dom, num_uc, cod_informante, !! sym(nome_coluna))
    return(base)
  }
  else{
    # A base morador é necessária para per-capitalizar as despesas
    base_pessoas <- morador %>% group_by(UF,COD_UPA, NUM_UC, NUM_DOM) %>% summarise(pessoas = n())
    base_pessoas <- base_pessoas %>% rename(cod_upa = COD_UPA, num_dom = NUM_DOM, num_uc = NUM_UC, uf = UF)
    base <- base %>% group_by(cod_upa, num_dom, num_uc) %>% summarise(!! sym(nome_coluna) := sum(V8000_DEFLA))
    base <- base %>% left_join(base_pessoas, by = c('cod_upa','num_dom','num_uc'), keep = FALSE)
    base <- base %>% mutate(!! sym(nome_coluna) := !! sym(nome_coluna)/pessoas)
    base <- base %>% select(cod_upa, num_dom, num_uc, !! sym(nome_coluna))
    return(base)
  }
}