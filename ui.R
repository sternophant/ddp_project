library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Stock chart"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      
      tags$p("This is simple shiny-app plotting (adjusted) close prices of stocks with or without a trend line.
             It was created as course project for the Developing Data Products course on Coursera. 
             Please enter a valid symbol below."),
      
      tags$p("Symbol examples: F (Ford), AAPL (Apple), ^GSPC (S&P 500)."),
      
      tags$hr(),
      
       textInput("symbol",
                 "Symbol:",
                  value = 'F'),
       
       checkboxInput("trend",
                     "Trend", 
                     value = TRUE)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("stock_plot")
    )
  )
))
