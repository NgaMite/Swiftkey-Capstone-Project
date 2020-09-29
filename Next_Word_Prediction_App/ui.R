library(shiny)
library(shinythemes)
library(wordcloud)

# Define UI for application that plots random distributions
shinyUI(navbarPage("Predictive Keyboard",
                            fluidRow(
                                h5("Created by Swan Htet Ye Yint"),
                                h5("Contact me : swan.hyy@gmail.com"),
                                h5("Source code can be found here - 'https://github.com/NgaMite/Swiftkey-Capstone-Project'"),
                                column(3),
                                column(6,
                                       tags$head(
                                           tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
                                       ),
                                       tags$div(
                                           #HTML('<textarea width="60%" id="text" rows="3" cols="30" class="form-control"></textarea>'),
                                           
                                           
                                           h3("Enter your text here"),
                                           tags$textarea(id = 'text', placeholder = 'Enter at least 2 words', rows = 3, class='form-control',""),
                                           
                                           
                                           
                                           uiOutput("prediction1",inline = T),
                                           uiOutput("prediction2",inline = T),
                                           uiOutput("prediction3",inline = T)),
                                       HTML("</div>"),align="center"),
                                
                                column(3),
                                
                            )
                   ))
        
    
