# ui.R
# Author: Panayiotis L.
# Date: 03 Oct 2020
# Description: Coursera Data Science Capstone Project (shiny app)
# GitHub: https://github.com/Ghost-8D/data_science_capstone

library(shiny)
library(shinythemes)
library(markdown)
library(dplyr)
library(tm)

shinyUI(navbarPage(
    "Word Prophet",
    theme = shinytheme("spacelab"),
    tabPanel("Home",
             fluidPage(
                 titlePanel("Home"),
                 sidebarLayout(
                     sidebarPanel(
                         includeHTML("sidebar.html"),
                         hr(),
                         "This app was created by ",
                         a("Panayiotis L.", href = "https://panayiotisleon1.wixsite.com/eportfolio"),
                         hr(),
                         textInput(
                             "userInput",
                             "Enter a word or phrase:",
                             value =  "",
                             placeholder = "Enter text here"
                         ),
                         br(),
                         sliderInput(
                             "numPredictions",
                             "Number of Predictions:",
                             value = 1.0,
                             min = 1.0,
                             max = 3.0,
                             step = 1.0
                         )
                     ),
                     mainPanel(
                         h3("Input Text"),
                         verbatimTextOutput("userSentence"),
                         br(),
                         h3("Predicted Words"),
                         verbatimTextOutput("prediction1"),
                         verbatimTextOutput("prediction2"),
                         verbatimTextOutput("prediction3")
                     )
                 )
             )),
    tabPanel(
        "About",
        h3("About Word Prophet"),
        br(),
        div(
            "Word Prophet is a Shiny app that takes as input text from the user
            and attempts to predict the next word using natural language 
            prediction algorithms.",
            br(),
            br(),
            "Once the user types one or more words, the prediction for the next 
            word will be displayed. Please allow a few seconds to process the
            input.",
            br(),
            br(),
            "You can use the slider tool to select up to top three next word 
            predictions. The top prediction will be shown first followed by the 
            second and third most likely next words.",
            br(),
            br(),
            "The source code for this application can be found on GitHub:",
            br(),
            br(),
            img(src = "github.png"),
            a(target = "_blank", 
              href = "https://github.com/Ghost-8D/data_science_capstone/tree/master/wordProphet",
              "Word Prophet")
        ),
        br(),
        h3("About Me"),
        br(),
        div(
            "My name is Panayiotis and I am a Data Scientist/Machine Learning 
            Engineer. I am currently working at one of the Big 4.",
            br(),
            br(),
            "I am mainly interested in computer vision, NLP and deep learning.",
            br(),
            br(),
            "I graduated from University of Cyprus with a Bachelor's degree in
            Computer Science.",
            br(),
            br(),
            "If you want, you can contact me through LinkedIn:",
            br(),
            br(),
            img(src = "linkedin.png"),
            a(target = "_blank", 
              href = "https://www.linkedin.com/in/panayiotis-leon/", "Panayiotis")
        )
    )
))
