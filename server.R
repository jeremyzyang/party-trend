#### server script 


library(shiny)
library(ggplot2)

# read data
data <- Corpus(DirSource("data"))


# server function

shinyServer(function(input, output) {

  wordcount.m <- reactive({
    
  count <- 1:length(data)
  
  for (i in 1:length(data))                              
  {txt <- as.character(data[[i]])
   s <- strsplit(txt," ")
   s <- tolower(s[[1]])
   count[i] <- length(grep(c(input$keyword),s,value=TRUE))}  
  
  time <- seq(1956,2012,4)
  d.freq <- count[1:15]
  r.freq <- count[31:45]
  
  df.m <- cbind(time,d.freq,r.freq)
  df.m <- as.data.frame(df.m)
  return (df.m)                                           
    
  }) 
  
  wordcount.s <- reactive({
    
    count <- 1:length(data)
    
    for (i in 1:length(data))                              
    {txt <- as.character(data[[i]])
     s <- strsplit(txt," ")
     s <- tolower(s[[1]])
     count[i] <- length(grep(c(input$keyword),s,value=TRUE))}  
    
    time <- seq(1956,2012,4)
    d.freq.s <- count[16:30]
    r.freq.s <- count[46:60]
    
    df.s <- cbind(time,d.freq.s,r.freq.s)
    df.s <- as.data.frame(df.s)
    return (df.s)                                           
    
  }) 
 
  
   
 
 
 
 output$plot1 <- renderPlot({
   
   ggplot(wordcount.m(), aes(x=time)) + 
   geom_point(aes(y = d.freq)) +
   geom_point(aes(y = r.freq)) +
   xlab("Year") +
   ylab("Freq of Keyword") +
   geom_line(aes(y = d.freq, colour= "red")) + 
   geom_line(aes(y = r.freq, colour= "blue")) +
   theme(legend.position="none") +
   scale_x_continuous(breaks = seq(1956, 2012, 4)) +
   theme(panel.grid.major = none, panel.grid.minor = none) 
 })
 
 output$plot2 <- renderPlot({
   
   ggplot(wordcount.s(), aes(x=time)) + 
     geom_point(aes(y = d.freq.s)) +
     geom_point(aes(y = r.freq.s)) +
     xlab("Year") +
     ylab("Freq of Keyword") +
     geom_line(aes(y = d.freq.s, colour= "red")) + 
     geom_line(aes(y = r.freq.s, colour= "blue")) +
     theme(legend.position="none") +
     scale_x_continuous(breaks = seq(1956, 2012, 4)) +
     theme(panel.grid.major = none, panel.grid.minor = none) 
 })

}) 
