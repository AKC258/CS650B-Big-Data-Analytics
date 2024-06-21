library(shiny)
library(shinythemes)  # pretty color schemes to pick from
library(ggplot2)

dataset <- diamonds   # or any dataset 

# User Interface Part

ui <- fluidPage(
  theme = shinytheme('superhero'), # cute grey & blue color scheme
  
  headerPanel("Diamonds Explorer"),
  
  sidebarPanel(
    
    sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
                value=min(1000, nrow(dataset)), step=500, round=0),
    
    # names refer to the column names of the dataset, all of them
    selectInput('x', 'X', names(dataset)),
    selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
    selectInput('color', 'Color', c('None', names(dataset)))
    
  ),
  
  mainPanel(
    plotOutput('plot')
  )
)

# Real work is here, careful with the brackets!!!

server <- function(input, output) {
  
  dataset <- reactive({
    diamonds[sample(nrow(diamonds), input$sampleSize),]
  })
  
  output$plot <- renderPlot({
    
    p <- ggplot(dataset(), aes_string(x=input$x, y=input$y))  + geom_point()
    
    if (input$color != 'None')
      p <- p + aes_string(color=input$color)
    
    print(p)
    
  }, height=400)
  
}

# Run the app ----
shinyApp(ui = ui, server = server)