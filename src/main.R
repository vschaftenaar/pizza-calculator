# set parameters
options(java.parameters = "-Xmx64g")
options(scipen = 999)
options(warn=-1)


# set project root
.args  <- commandArgs(trailingOnly = TRUE)
.root <- ifelse(is.na(.args[1]) || is.null(.args[1]), normalizePath(file.path(getwd())),.args[1])

library(shiny)

# load scripts ------------------------------------------------------------
invisible(sapply(list.files(path = file.path(.root,'src','app')      ,pattern="*.R",full.names = T,recursive = T),source))

.config <- list(
   host = "127.0.0.1"
  ,port = sample(c(1000:65535))[1]
)
  
# run app -----------------------------------------------------------------
runApp(
  appDir         =  file.path(.root,'src','app')
  , port           = .config$port
  , host           = .config$host
  , launch.browser =  shell(paste0('start msedge --app=http://',.config$host,':',.config$port)))
