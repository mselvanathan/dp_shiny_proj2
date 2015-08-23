library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Relationship of Wage to education, race and marital status"),
  
  # Sidebar with controls to select the variable to plot against mpg
  # and to specify whether outliers should be included
  sidebarPanel(
    selectInput("variable", "Variable:",
                list("Education" = "education", 
                     "Race" = "race", 
                     "Marital Status" = "maritl")),
    
    checkboxInput("outliers", "Show outliers", FALSE)
  ),
  
  # Show the caption and plot of the requested variable against wage
  mainPanel(
    h3(textOutput("caption")),
    
    plotOutput("WagePlot")
  )
))
