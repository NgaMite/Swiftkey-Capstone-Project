library(shiny)
library(dplyr)

df_trigram <- read.csv("df_trigram_final.csv", stringsAsFactors = FALSE)

predict_word <- function(x) {
    
    x <- tolower(x)
    x <- gsub("[^[:alnum:][:space:]]", " ", x)
    
    splitted <- unlist(strsplit(x, split=" "))
    
    N <- length(splitted)
    
    
    subdata1 <- df_trigram[df_trigram$word2 == splitted[N],]
    subdata2 <- subdata1[subdata1$word1 == splitted[N-1],]
    
    if(nrow(subdata2) > 0)
        predicted <- subdata2[order(subdata2$count, decreasing=TRUE), "word3"]
    else if (nrow(subdata1) > 0){
        predicted <- subdata1 %>%
            group_by(word2, word3) %>%
            summarise(count=n()) %>%
            arrange(desc(count))
        predicted <- predicted$word3
    }
    else
        predicted <- 'the'
    
    predicted <- na.omit(predicted)
    
    if(length(predicted) >= 3)
        predicted[1:3]
    else
        predicted[1:length(predicted)]
}

shinyServer(
    function(input, output, session){
        
        
        
        observe({
            
            
            
            predictions <- predict_word(input$text)
            a1 <<- predictions[1]
            a2 <<- predictions[2]
            a3 <<- predictions[3]
            
            output$prediction1 <- renderUI({
                actionButton("button1", label = a1)
                #HTML("<button id="prediction1" class="shiny-text-output"></button>")
            })
            
            
            output$prediction2 <- renderUI({
                actionButton("button2", label = a2)
                
            })
            
            
            
            output$prediction3 <- renderUI({
                actionButton("button3", label = a3)
                
            })
            
            
            
            
        })
        
        observeEvent(input$button1, {
            if(input$button1 == 1){
                name <- paste(input$text, a1)
                updateTextInput(session, "text", value=name)
            }
            
        })
        
        observeEvent(input$button2, {
            
            name <- paste(input$text, a2)
            updateTextInput(session, "text", value=name)
        })
        
        observeEvent(input$button3, {
            
            name <- paste(input$text, a3)
            updateTextInput(session, "text", value=name)
        })
        
        
        
    }
)