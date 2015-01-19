library(shiny)
library(randomForest)


survivalPrediction <- function(myPclass, mySex, mySibSp, myParch, myFare, myEmbarked) { 

    train <- read.csv("./db/train.csv")
    
    fit <- randomForest(as.factor(Survived) ~ Pclass + Sex + SibSp + Parch + Fare + Embarked,
                        data=train, importance=TRUE, ntree=2000)
    
    test <- train[1, -c(1, 2, 4, 6, 9, 11)]
    
    ## Initialise the data frame with the values supplied by the user
    test <- rbind(test, data.frame(
        Pclass=as.integer(myPclass),  ##Pclass
        Sex=mySex,                    ##Sex
        SibSp=as.integer(mySibSp),    ##SibSp
        Parch=as.integer(myParch),    ##Parch 
        Fare=as.numeric(myFare),      ##Fare
        Embarked=myEmbarked))         ##Embarked

    test <- test[-1,]
    
    pred <- predict(fit, test)

    if (pred == 0) {
        response <- "Passenger did not survive" 
    }
    else if (pred == 1) {
        response <- "Passenger survived!"
    }
    else {
        response <- "An error has occurred.  Lets assume the passenger survived, OK?"
    }
    
    return(response)
}

shinyServer(
    function(input, output) {
    
        output$inputPclass <- renderText({paste("Passenger class: ", input$Pclass)})
        output$inputSex <- renderText({paste("Passenger gender: ", input$Psex)})
        output$inputSibSp <- renderText({paste("Number of Siblings/Spouses aboard: ", input$SibSp)})
        output$inputParch <- renderText({paste("Number of Parents/Children aboard: ", input$Parch)})
        output$inputFare <- renderText({paste("Passenger fare: ", as.numeric(input$Fare))})
        output$inputEmbarked <- renderText({paste("Passenger embarked at: ", input$Embarked)})
        
        output$prediction <- renderText({survivalPrediction(input$Pclass,
                                                             input$Psex,
                                                             input$SibSp,
                                                             input$Parch,
                                                             input$Fare,
                                                             input$Embarked)})
    }
)