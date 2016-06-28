library(shiny)
library(ggplot2)
library(quantmod)
library(mgcv)

# Define server logic
shinyServer(function(input, output) {
  
  data_stock <- reactive({
    data_stock <- getSymbols(input$symbol, auto.assign = FALSE)
    data_stock <- data.frame(date = time(data_stock), adjusted_value = data_stock[ , 6])
    data_stock <- data.frame(date = data_stock$date, adjusted_value = data_stock[ , 2])
  })
  
  plot <- reactive({
    plot <- ggplot(data = data_stock(), aes(x = date, y = adjusted_value)) + 
      geom_line(colour = "blue") + 
      labs(title = paste("Symbol:", input$symbol)
           , x = "", y="Adjusted Close Pirce [USD]")
  })
  
  output$stock_plot <- renderPlot({
    if (input$trend == TRUE) {
      plot <- plot() + geom_smooth()
    } else{
      plot <- plot()
    }
    
    plot
    
  })
  
})
