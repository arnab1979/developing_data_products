library(shiny)
library(ggplot2)


shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
          inputFile <- "./data/HollywoodsMostProfitableStories.csv"
          movieData <- read.csv(inputFile, sep = ",")
          aggMovieData <- aggregate(WorldwideGross ~ Genre + Year, data = movieData, sum,na.rm = TRUE)
          aggMovieData$WorldwideGross <- round(aggMovieData$WorldwideGross,0) 
          
          if (input$inputGenre != "ALL"){
                  aggMovieData <- aggMovieData [aggMovieData$Genre == input$inputGenre,]
                  p <- ggplot(data = aggMovieData,aes(Year,WorldwideGross, group = as.factor(Genre), color = Genre)) 
                  p <- p + theme(legend.position="none")
                  p <- p + ggtitle(toupper(input$inputGenre))
                  p <- p + theme(plot.title = element_text(hjust = 0.5))
          }
          else {
                  p <- ggplot(data = aggMovieData,aes(Year,WorldwideGross, group = as.factor(Genre), color = Genre))
                  p <- p + ggtitle("ALL GENRE")
                  p <- p + theme(plot.title = element_text(hjust = 0.5))
          }
          p <- p + geom_line() + geom_point() + labs(x = "YEAR", y= "WORLDWIDE GROSS SALE (M)")
          print(p)

  })
  
})
