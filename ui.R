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
           plotOutput('plot1')),
    column(1,p("Blue:Democrat",style='color:blue'),
           br(),
           p("Red:Republican",style='color:red'))
    
  ),
  
  fluidRow(
    
    column(2,h5("Presidential Speech:")),
    
    column(8,
           plotOutput('plot2'))
  
  ),
  
  hr(),
  
  fluidRow(
    
    column(4,p("")),
    column(4, 
           textInput("keyword", label = h3("Enter the keyword:"), 
                     value = "good")),   
    column(4,p(""))
    
    
    
  )
  
  
))
