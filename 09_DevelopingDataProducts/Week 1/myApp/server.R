library(shiny)

shinyServer(function(input, output){
    output$text1 = renderText(input$Slider2 + 10)
})