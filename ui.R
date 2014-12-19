#### ui script

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  
  # Application title
  titlePanel("Keyword Trend"),
  
  p("Jeremy Yang"),
  
  
  # Sidebar with a slider input for the number of bins
  
  
  fluidRow(
    
    column(2,h5("Party Manifesto:")),
    
    column(8,
           plotOutput('plot1'))
    
  ),
  
  fluidRow(
    
    column(2,h5("Presidential Speech:")),
    
    column(8,
           plotOutput('plot2'))
  
  ),
  
  hr(),
  
  fluidRow(
    
    column(4,p("")),
    column(6, 
           textInput("keyword", label = h5("Enter the keyword:"), 
                     value = "god")),   
    column(2,p(""))
    
    
    
  )
  
  
))

