#### ui script

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  
  # Application title
  titlePanel("Keyword Trend"),
  h5("Yang/Singh"),
  br(),
  h4('Extract party manifesto and presidential speech text from American Presidency Project and plot the time-serie of the frequency of a chosen word.'),
  
    
  
  fluidRow(
    
    column(4),
    column(2, 
           textInput("keyword", label = h4("Enter the keyword:"), 
                     value = "god")),   
    column(1,br(),br(),submitButton("Submit"))),
  
  hr(),
  
  
  
  fluidRow(
    
    column(2,h4("Party Manifesto:")),
    
    column(8,
           plotOutput('plot1'))
    
    
  ),
  
  fluidRow(
    
    column(2,h4("Presidential Speech:")),
    
    column(8,
           plotOutput('plot2')))
    
    
    
  
  
))

