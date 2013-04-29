library(shiny)
library(ggplot2)

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {

  xydata <- c(x=1:10, y=(1:10)^2)
  
  output$dispPlot <- renderPlot({
    if(is.null(input$file)){return()}
    # read intercept,slope file
    interceptslope <- read.csv(file=input$file$datapath)
    names(interceptslope) <- c("b", "m")
    interceptslope$rank = nrow(interceptslope):1
    print(fitted_line_graph(interceptslope))
  })
  
  output$fileTable <- renderTable({
    if(is.null(input$file)){return()}
    input$file
  })

})
