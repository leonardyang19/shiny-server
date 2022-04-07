library(shiny)
library(dplyr)
library(ggplot2)
library(rmarkdown)

# Define UI for application that draws a histogram
ui <- navbarPage("Iris Test",
                 
                 tabPanel('Test',
                          
                          fluidRow(
                            column(12, align = 'center',
                                   selectInput('inputz', 'Select a Species:',
                                               choices = iris$Species %>% unique() )
                            ) ## col
                          ), ## row
                          
                          fluidRow(
                            column(12, align = 'center',
                                   plotOutput('plotz') 
                            ) ## col
                          ) ## row
                 ) ## tab
) ## tabPanel

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$plotz <- renderPlot({
    
    iris %>% filter(Species == input$inputz) %>%
      ggplot(aes(x=Petal.Length, y = Petal.Width) ) + geom_point() + theme_classic() +
      ggtitle(paste0('Petal Width vs Length for ', input$inputz) )
    
  })
  
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)
