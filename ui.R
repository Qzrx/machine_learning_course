library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Linear approximation display tool"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    fileInput("file","File to upload", multiple=FALSE)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("dispPlot"),
    tableOutput("fileTable")
  )
))
