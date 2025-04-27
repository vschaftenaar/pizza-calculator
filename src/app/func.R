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
