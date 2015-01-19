library(shiny)

# Define UI for dataset viewer application
shinyUI(
    fluidPage(
        # Application title
        titlePanel("Passenger survival prediction on the Titanic"),
        helpText("This application predicts the survival of a hypothetical Titantic passenger. A Random Forest prediction model has been fit on a passenger list supplied by", a("Kaggle.", href="https://www.kaggle.com/c/titanic-gettingStarted/data", target="_blank")),
        helpText("For the sake of simplicity, many of the passenger attributes (except those displayed below) have been ignored."),
        sidebarLayout(
        sidebarPanel(
            helpText("You can set the attributes of the passenger here. Then, when done, press Submit.  The prediction algorithm will then report whether a passenger with those attributes were likely to survive or not aboard the ill-fated voyage."),
            radioButtons('Pclass', 'Passenger class (or Socioeconomic status):', c('1st (Upper)' = 1, '2nd (Middle)' = 2, '3rd (Lower)' = 3)),
            radioButtons('Psex', 'Passenger gender:', c('Male' = 'male', 'Female' = 'female')) ,           
            sliderInput('SibSp', 'Number of Siblings/Spouses Aboard:', 1, min = 0, max = 8, step = 1),
            sliderInput('Parch', 'Number of Parents/Children Aboard:', 0, min = 0, max = 6, step = 1),
            sliderInput('Fare', 'Passenger Fare:', 15.0, min = 0.0, max = 250.0, step = 5.0, format = "#,###.0", locale = "us"),
            radioButtons('Embarked', 'Port of Embarkation:', c('Cherbourg (C)' = 'C', 'Queenstown (Q)' = 'Q', 'Southampton (S)' = 'S')),
            submitButton('Submit')
        ),
        mainPanel(
            h3('Results of prediction'),
            h4('You entered a passenger with the following attributes:'),
            textOutput("inputPclass"),
            textOutput("inputSex"),
            textOutput("inputSibSp"),
            textOutput("inputParch"),
            textOutput("inputFare"),
            textOutput("inputEmbarked"),
            h4('Which resulted in a prediction of '),
            verbatimTextOutput("prediction")
        )
    )
))