library(shiny)

# Define UI for application that plots random distributions
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Visualize your machine learning!"),
  
  # File input box
  conditionalPanel(
    condition = "file != null",
 #   sidebarPanel(
      fileInput("file","File to upload\n", multiple=FALSE)
  #  )
  ),
  
  # Show a plot of the generated slope/intercept pairs
  mainPanel(
    plotOutput("dispPlot"),
#     tableOutput("fileTable")
    p("Credit: Robert Beebe")
  )
))
