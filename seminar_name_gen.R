library(stringr)


seminar_name_generator <- function(){
  dbc = c(TRUE, 
          FALSE,
          FALSE,
          FALSE,
          FALSE)
  
  lista0 = c('Debate de Conjuntura: ')
  
  lista1 = c('Olhares ',
             'Visões ', 
             'Reflexões ',
             'Mobilizações ',
             'Resistências ', 
             'Revoluções ',
             'Reemergencias ',
             'Observações ', 
             'Vozes contemporâneas ',
             'Dilemas ',
             'Os impactos ',
             'Os limites ',
             'Necessidades ',
             'Relatos ',
             'Mulheres: Resistências ',
             'Desafios ',
             'Transformações ',
             'As Experiências ')
  
  lista2 = c('Descoloniais ',
             'Decoloniais ',
             'do Sul Global ',
             'Críticas ',
             'Paradigmátic@s ',
             'Orientalistas ',
             'da Sociologia Política Internacional ',
             'de Mulheres ',
             'do Neoliberalismo ')
  
  lista3 = c('sobre o BRICS ',
             'da Política Externa Americana ', 
             'acerca da política ambiental ',
             'sobre a Projeção Chinesa ',
             'na Rio+20 ')
  
  lista4 = c('em Tempos de Crise', 
             'pós-BREXIT', 
             'no Governo Trump', 
             'na America Latina', 
             'no Brasil', 
             'na Academia', 
             'sobre os Países em Desenvolvimento',
             'no Atlântico Sul',
             'e o Risco à Democracia',
             'e Direitos Humanos no Brasil',
             ': Uma Visão de Teoria como Prática Cotidiana',
             ': Uma Prescpectiva Contemporânea')
  
  zerocond = sample(dbc, 1)
  first = sample(lista1, 1)
  sec = sample(lista2, 1)
  third = sample(lista3, 1)
  fourth = sample(lista4, 1)
  
  if(zerocond == FALSE){
  str.result = str_c(first, sec, third, fourth)
  } else {
    str.result = str_c(lista0, first, sec, third, fourth)
  }
  return(str.result)
}
