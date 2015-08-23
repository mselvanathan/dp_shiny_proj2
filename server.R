library(shiny)
library(ISLR)

# We tweak the "education", "race", "marital status" field to have nicer factor labels. Since this doesn't
# rely on any user inputs we can do this once at startup and then use the
# value throughout the lifetime of the application
WageData <- Wage
WageData$education <- factor(WageData$education, labels = c(" < High School", "HS Grad", "Some College", "College Grad", "Advanced Degree"))
WageData$race <- factor(WageData$race, labels = c("White", "Black", "Asian", "Other"))
WageData$maritl <- factor(WageData$maritl, labels = c("Never Married", "Married", "Widowed", "Divorced", "Separated"))

# Define server logic required to plot various variables against wage
shinyServer(function(input, output) {
  
  # Compute the forumla text in a reactive expression since it is 
  # shared by the output$caption and output$mpgPlot expressions
  formulaText <- reactive({
    paste("wage ~", input$variable)
  })
  
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate a plot of the requested variable against wage and only 
  # include outliers if requested
  output$WagePlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = WageData,
            outline = input$outliers)
  })
})
