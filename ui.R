library(shiny)
library(R.utils)
library(ggplot2)
library(gridExtra)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        
        # Application title
        titlePanel("Movie Profit Analysis"),
        br(),
        div(
                h5("This application provides interactive interface to analyze profit for different Genre over the years."),
                h5("Select a Genre to proceed or select ALL to display all Genres simulteneously."),
                style = "border: solid #DCDCDC 1px; background: #f0f5f5; border-radius: 5px;"),
        br(),
        sidebarLayout(
                sidebarPanel(

                        selectInput("inputGenre", "Select the Genre", c(  "ALL",
                                                                         "Action",
                                                                         "Animation",
                                                                         "Comedy",
                                                                         "Drama",
                                                                         "Fantasy",
                                                                         "Romance"),
    
                         
                        selected = NULL, multiple = FALSE,
                        selectize = TRUE, width = NULL, size = NULL)
                        
                  ),
                
                # Show a plot of the generated distribution
                mainPanel( plotOutput("distPlot"))
        )
))
