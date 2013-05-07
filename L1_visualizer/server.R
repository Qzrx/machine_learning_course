library(shiny)
library(ggplot2)
source('fitted_line_graph.R')
source('errorbar_data.R')

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {
  
  output$dispPlot <- renderPlot({
    if(is.null(input$file)){return()}
    # read intercept,slope file
    interceptslope <- read.csv(file=input$file$datapath,header=F)
    names(interceptslope) <- c("b", "m")
    interceptslope$rank = nrow(interceptslope):1
    print(fitted_line_graph(interceptslope))
  })
  
  output$fileTable <- renderTable({
    if(is.null(input$file)){return()}
    input$file
  })
  
})
