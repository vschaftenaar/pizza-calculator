
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