
server <- function(input, output, session) {
  session$onSessionEnded(stopApp)  
  
  output$txt <- renderUI(.get.info(input))
  
}