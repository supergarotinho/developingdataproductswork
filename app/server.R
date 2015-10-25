## server.R
library(shiny)
library(datasets)

fit <- lm(mpg ~ cyl + hp + wt + gear + as.factor(am), data = mtcars)

shinyServer(
    function(input, output) {
        result <- renderText({as.character(predict(fit,data.frame(cyl=as.integer(input$cyl),
                                         hp=as.integer(input$hp),
                                         wt=as.integer(input$wt)/1000,
                                         gear=as.integer(input$gear),
                                         am=as.factor(input$transmission))))})
        output$cyl <- renderText({as.integer(input$cyl)})
        output$hp <- renderText({as.integer(input$hp)})
        output$wt <- renderText({as.integer(input$wt)})
        output$gear <- renderText({as.integer(input$gear)})
        output$transmission <- renderText({
                if (input$transmission == 1) {
                    "Manual"
                } else {
                    "Automatic"
                }
            })
        output$result <- result
    }
)