library('randomForest')

train <- read.csv("train.csv")

fit <- randomForest(as.factor(Survived) ~ Pclass + Sex + SibSp + Parch + Fare + Embarked,
                    data=train, importance=TRUE, ntree=2000)

## Initialise the data frame with the values supplied by the user
test <- data.frame(as.integer('3'),     ##Pclass
                   'male',              ##Sex
                   as.integer('1'),     ##SibSp
                   as.integer('0'),     ##Parch 
                   as.numeric('7.25'),  ##Fare
                   'S')                 ##Embarked

## Add col labels
names(test) = c("Pclass", "Sex", "SibSp", "Parch", "Fare", "Embarked")

## Set factor levels otherwise predict fails
levels(test$Sex) <- c("male", "female")
levels(test$Embarked) <- c("S", "C", "Q", "")

predict(fit, test)