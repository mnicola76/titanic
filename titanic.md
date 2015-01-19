Titanic Passenger Survival Prediction
========================================================
## A presentation for Developing Data Products - Coursera
Author: mnicola76  
Date: January 19 2015

Introduction
========================================================
font-import: http://fonts.googleapis.com/css?family=Risque
font-family: 'Risque'
<small>RMS Titanic was a British passenger liner that sank in the North Atlantic Ocean in the early morning of 15 April 1912 after colliding with an iceberg during her maiden voyage from Southampton, UK to New York City, US. The sinking of Titanic caused the deaths of more than 1,500 people in one of the deadliest peacetime maritime disasters in modern history.  
[*... from Wikipedia*](http://en.wikipedia.org/wiki/RMS_Titanic)</small>
***
![titanic sinks!](titanic.jpg)
<small>The "women and children first" protocol was followed once she began to sink.  Does the data tell a different story?</small>


The Application
========================================================
font-import: http://fonts.googleapis.com/css?family=Risque
font-family: 'Risque'
<small>
This [application] (https://mnicola76.shinyapps.io/titanic/) allows you to 'create' a hypothetical passenger aboard the ship.  A Random Forest prediction algorithm will then determine whether this passenger was likely to have survived the voyage.  The Random Forest has been built upon a test dataset provided by [Kaggle.](https://www.kaggle.com/c/titanic-gettingStarted/data)
</small>
***
<small>
The [application] (https://mnicola76.shinyapps.io/titanic/) is straight-forward to use.  The attributes of the passenger can be changed by moving the sliders and radio buttons accordingly.
</small>
![application usage!](app.png)

Application - Technical Details
========================================================
font-import: http://fonts.googleapis.com/css?family=Risque
font-family: 'Risque'
<small>
The model has been fit to a subset of columns in order to simplify the process.





```
  Pclass    Sex SibSp Parch Fare Embarked
2      1 female     0     0   50        S
```

The user's hypothetical passenger is then passed to the `prediction` method to determine whether they survived or not.  (1=survival, 0=non-survival)


```
[1] "1"
```
</small>

Future Enhancements
========================================================
font-import: http://fonts.googleapis.com/css?family=Risque
font-family: 'Risque'
* Full data cleansing so all passenger attributes can be used to build the prediction model
* Result is a percentage survival rate rather than a binary result
* Allow the user the choice of prediction model rather than just Random Forest
