library(shiny)
library(ggplot2)

# Define the UI
ui <- fluidPage(
  
  # Title of the app
  titlePanel("Iris Dataset Histograms"),
  
  # Sidebar with input options
  sidebarLayout(
    sidebarPanel(
      # Slider input for bin size
      sliderInput("bins", "Bin size:", min = 1, max = 50, value = 30),
      
      # Color input for each histogram
      selectInput("color1", "Select color for Sepal.Length", choices = c("red", "green", "blue", "black"), selected = "red"),
      selectInput("color2", "Select color for Sepal.Width", choices = c("red", "green", "blue", "black"), selected = "green"),
      selectInput("color3", "Select color for Petal.Length", choices = c("red", "green", "blue", "black"), selected = "blue"),
      selectInput("color4", "Select color for Petal.Width", choices = c("red", "green", "blue", "black"), selected = "black")
    ),
    
    # Main panel with output plots
    mainPanel(
      # Histograms for each property
      plotOutput("hist1"),
      plotOutput("hist2"),
      plotOutput("hist3"),
      plotOutput("hist4")
    )
  )
)

# Define the server
server <- function(input, output) {
  
  # Load the iris dataset
  data("iris")
  
  # Histogram for Sepal.Length
  output$hist1 <- renderPlot({
    ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
      geom_histogram(binwidth = input$bins, color = input$color1) +
      labs(title = "Histogram of Sepal.Length", x = "Sepal Length", y = "Count")
  })
  
  # Histogram for Sepal.Width
  output$hist2 <- renderPlot({
    ggplot(iris, aes(x = Sepal.Width, fill = Species)) +
      geom_histogram(binwidth = input$bins, color = input$color2) +
      labs(title = "Histogram of Sepal.Width", x = "Sepal Width", y = "Count")
  })
  
  # Histogram for Petal.Length
  output$hist3 <- renderPlot({
    ggplot(iris, aes(x = Petal.Length, fill = Species)) +
      geom_histogram(binwidth = input$bins, color = input$color3) +
      labs(title = "Histogram of Petal.Length", x = "Petal Length", y = "Count")
  })
  
  # Histogram for Petal.Width
  output$hist4 <- renderPlot({
    ggplot(iris, aes(x = Petal.Width, fill = Species)) +
      geom_histogram(binwidth = input$bins, color = input$color4) +
      labs(title = "Histogram of Petal.Width", x = "Petal Width", y = "Count")
  })
}

# Run the app
shinyApp(ui, server)

