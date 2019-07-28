library(shiny)
library(stringr)

# Define a User Interface
ui <- fluidPage(
   
   # Titulo
   titlePanel("Gerador de Nomes para Eventos do IRI"),
   
      # Cria uma navlist (menu) lateral.
      navlistPanel(
      #inicio dos dados que estarão no primeiro item do menu, denominado: inicio.
         tabPanel('Inicio',
        br(),
        p('O Instituto de Relações Internacionais (IRI/PUC-Rio) realiza semestralmente dezenas de eventos acadêmicos, 
          que em sua maioria são muito interessantes, porém, é possível perceber que eles são nomeados de acordo com um determinado padrão.'),
        p('Com o intuito de diminuir o esforço dos responsáveis por idealizar estes nomes, este App gera aleatoriamente, 
          a partir de um pool de palavras já utilizadas em eventos do IRI, nomes (que fazem sentido) para que possam ser utilizados 
          em eventos futuros.'),
        br(),
        p('Aperte no botão abaixo para gerar o nome de um evento:'),
        br(),
        actionButton('butger', 'Gerar!'), #Cria o botão responsável por rodar a função.
        br(),
        br(),
        strong('O nome do evento é: '),
        textOutput("text"), #Texto que é retornado como resultado da funço.
        br(),
        br(),
        br(),
        br(),
        br(),
        br()
      ),
         #Informaçoes que estarao no segundo painel do menu, denominado: sobre
      tabPanel('Sobre',
               em("No momento, são possíveis '66528' diferentes combinações de nomes"),
               br(),
               p('Este ShinyApp foi criado por: João Pedro Oliveira [@kimjoaoun]'),
               br(),
               p('Esta aplicação não tem o objetivo de ofender nenhum funcionário ou instituição qual acima se é referida. 
                 Em caso de algum contratempo, por favor, contatar o desenvolvedor: joaopedro3d@me.com')
               
      )
      )
   )

# Define server logic required to draw a histogram
server <- function(input, output) {

  ######
   #[1]
        dbc = c(TRUE, 
                FALSE,
                FALSE,
                FALSE,
                FALSE,
                FALSE,
                FALSE)
        #[1]
        lista0 = c('Debate de Conjuntura: ',
                   '(Des)construindo ') #BLoco 0: Nem sempre estara presente, só 1/6 de chance de aparecer.
        
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
                   'As Experiências ',
                   'Epistemologias ',
                   'Cooperações ',
                   'Geografias ') #Bloco 1.
        
        lista2 = c('Descoloniais ',
                   'Decoloniais ',
                   'do Sul Global ',
                   'Críticas ',
                   'Paradigmátic@s ',
                   'Orientalistas ',
                   'da Sociologia Política Internacional ',
                   'de Mulheres ',
                   'do Neoliberalismo ',
                   'Africanas '
                   ) #Bloco 2.
        
        lista3 = c('sobre o BRICS ',
                   'da Política Externa Americana ', 
                   'acerca da política ambiental ',
                   'sobre a Projeção Chinesa ',
                   'na Rio+20 ',
                   'dos Nacionalismos ',
                   'sobre a fragilidade do MERCOSUL ',
                   'das Relações Internacionais '
                   ) #Bloco 3
        
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
                   ': Uma Perspectiva Contemporânea',
                   ': Um Cenário Pós-colonial',
                   'em Perspectiva Global',
                   'e Resolução de Conflitos',
                   'sob o Olhar Feminino') #Bloco 4 (e final).
######
  
      ntext <- eventReactive(input$butger, { #Função executada após o botao ser apertado
         
        zerocond = sample(dbc, 1) #[1] Escolhe entre TRUE ou FALSE (1/6 de chance de ser TRUE).
        zero = sample(lista0, 1) #Caso zerocond == TRUE, sortear uma string da lista0.
        first = sample(lista1, 1) #Sorteia uma string da lista1
        sec = sample(lista2, 1) #Sorteia uma string da lista2
        third = sample(lista3, 1) #Sorteia uma string da lista3
        fourth = sample(lista4, 1) #Sorteia uma string da lista4
        
        if(zerocond == FALSE){
          str.result = stringr::str_c(first, sec, third, fourth) #str_c concatena as strings sorteadas em uma só string.
        } else {
          str.result = stringr::str_c(zero, first, sec, third, fourth) #Caso a zerocond seja verdadeiro, adicionar na string o que fora
          #sorteado para continuar a frase.
        }
        
        str.result #String resultante do processo.
        }
        
      )
          
  output$text <- renderText({
    ntext()
})
  
}

# Run the application 
shinyApp(ui = ui, server = server)

