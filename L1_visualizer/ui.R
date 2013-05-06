library(shiny)

# Define UI for application that plots random distributions
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Visualize your machine learning!"),
  
  # Sidebar with a slider input for number of observations
  conditionalPanel(
    condition = "file != null",
 #   sidebarPanel(
      fileInput("file","File to upload\n", multiple=FALSE)
  #  )
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("dispPlot"),
#     tableOutput("fileTable")
    p("Credit: Robert Beebe")
  )
))
