library(shiny)


.get.info <- function(input){
  hydration <- input$hydratation/100
  pizza     <- list(n=input$pizza.n,size=input$pizza.weight)
  flour.p   <- input$poolish.weight/2
  water.p   <- input$poolish.weight/2
  ratio     <- 2
  
  water.d <- water.p*ratio
  flour.d <- round(((water.d+water.p) / hydration  - flour.p)/10)*10
  weight  <- water.d+water.p+flour.d+flour.p
  .ws <- function(n)paste0(rep('&nbsp',n),collapse = '')
  
  txt <- p(style='font-size:18px;font-family:consolas',HTML(paste0(
           'flour (poolish / dought) : ',.ws(3),flour.p,' / ',flour.d,'<br>'
          ,'water (poolish / dought) : ',.ws(3), water.p,' / ',water.d,'<br>'
          ,'hydration : ',.ws(18), round(100*(water.p+water.d)/(flour.p+flour.d),1),'%<br><br>'
          ,'weight per pizza : ',.ws(11), round(weight/pizza$n,1),'<br>'
          ,'pizzas of ',pizza$size,'gr : ',.ws(12),round(weight/pizza$size,1)
          )))
  
  return(txt)
}


ui <- fillPage(
   column(12,hr())
  ,column(3,numericInput('hydratation','hydratation (%)'   ,65 ,min = 50 ,max = 100,step = 1, width = '100%'))
  ,column(3,numericInput('poolish.weight','poolish (gr)'   ,220,min = 100,max = 600,step =  10,width = '100%'))
  ,column(3,numericInput('pizza.weight','pizza weight (gr)',280,min = 200,max = 350,step =  5,   width = '100%'))
  ,column(3,numericInput('pizza.n','pizza (#)'             ,3  ,min = 1  ,max = 5  ,step =  1,   width = '100%'))

  ,column(
    12
    ,hr()
    ,uiOutput('txt')
  )
  
)

server <- function(input, output, session) {
  session$onSessionEnded(stopApp)  

  output$txt <- renderUI(.get.info(input))
  
}

shinyApp(ui, server,options = list(launch.browser=T))


