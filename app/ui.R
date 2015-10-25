## ui.R
shinyUI(pageWithSidebar(
    headerPanel("Miles per Gallon Car Prediction"),
    sidebarPanel(
        sliderInput("cyl", "Number of cylinders:", 
                    min=4, max=8, value=6, step=2),
        sliderInput("hp", "Gross horsepower:", 
                    min=52, max=335, value=80, step=1),
        sliderInput("wt", "Weight (lb):", 
                    min=1513, max=5424, value=2000, step=1),
        sliderInput("gear", "Number of forward gears:", 
                    min=3, max=5, value=5, step=1),
        selectInput("transmission", "Transmission Type:", 
                    choices = c("Automatic" = 0, "Manual" = 1))
    ),
    mainPanel(
        h2("How to use this app?"),
        p("Your must specify some of your car characteristics in the left form. The miles per gallon prediction is informed bellow. You don't need to click in any button, just change the values in the form and the prediction is done automaticaly."),
        h2("Your input",style="color:blue"),
        h4('Number of cylinders:'),
        textOutput('cyl'),
        h4('Gross horsepower:'),
        textOutput('hp'),
        h4('Weight (lb/1000):'),
        textOutput('wt'),
        h4('Number of forward gears:'),
        textOutput('gear'),
        h4('Transmission Type:'),
        textOutput('transmission'),
        br(),
        h2("Result",style="color:red"),
        h4('Miles/(US) gallon predicted:'),
        textOutput('result')
    )
))