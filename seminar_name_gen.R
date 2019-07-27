library(shiny)
library(stringr)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Gerador de Nomes para Eventos do IRI"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel("Aperte o Botão:  ",
        
        actionButton('butger', 'Gerar')
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        em('O Instituto de Relações Internacionais (IRI/PUC-Rio) realiza semestralmente dezenas de eventos acadêmicos, 
          que em sua maioria são muito interessantes, porém, é possível perceber que eles são nomeados de acordo com um determinado padrão.'),
        br(),
        em('Com o intuito de diminuir o esforço dos responsáveis por idealizar estes nomes, este App gera aleatoriamente, 
          a partir de um pool de palavras já utilizadas em eventos do IRI, nomes (que fazem sentido) para que possam ser utilizados 
          em eventos futuros.'),
        br(),
        em("No momento, são possíveis '29106' diferentes combinações de nomes"),
        br(),
        br(),
        strong('O nome do evento é: '),
        textOutput("text"),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        p('Criado por: João Pedro Oliveira [@kimjoaoun]'),
        br(),
        p('Esta aplicação não tem o objetivo de ofender nenhum funcionário ou instituição qual acima se é referida.'),
        p('Em caso de algum contratempo, por favor, contatar o desenvolvedor: joaopedro3d@me.com')
        
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  ######
        dbc = c(TRUE, 
                FALSE,
                FALSE,
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
                   'As Experiências ',
                   'Epistemologias ',
                   'Cooperações ',
                   'Geografias ')
        
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
                   )
        
        lista3 = c('sobre o BRICS ',
                   'da Política Externa Americana ', 
                   'acerca da política ambiental ',
                   'sobre a Projeção Chinesa ',
                   'na Rio+20 ',
                   'dos Nacionalismos ',
                   'sobre a fragilidade do MERCOSUL ',
                   'das Relações Internacionais '
                   )
        
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
                   'em Perspectiva Global')
######
  
      ntext <- eventReactive(input$butger, {
        zerocond = sample(dbc, 1)
        first = sample(lista1, 1)
        sec = sample(lista2, 1)
        third = sample(lista3, 1)
        fourth = sample(lista4, 1)
        
        if(zerocond == FALSE){
          str.result = stringr::str_c(first, sec, third, fourth)
        } else {
          str.result = stringr::str_c(lista0, first, sec, third, fourth)
        }
        
        str.result
        }
        
      )
          
  output$text <- renderText({
    ntext()
})
  
}

# Run the application 
shinyApp(ui = ui, server = server)

