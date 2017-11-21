# Define UI for application that draws a histogram
library(shiny)
library(readr)
library(tidyverse)
library(readr)
library(dplyr)
library(DT)
library(ggplot2)
library(shinyjs)
library(shinydashboard)

ui <- dashboardPage(
	
	# Application title
        dashboardHeader(title = "Homework 8: BC Liquor Store Version", titleWidth = 400),
	
        dashboardSidebar(
                width = 400,
                img(src = "BC_liquor.jpg", width = "100%"),
                h1("Data Selection Criteria"),
                sliderInput("priceIn","Select the price of booze.", min=0, max=300, value=c(0,300), pre = "CAD"),
                checkboxGroupInput("typeIn","What type of booze do you need?", choices = c("BEER","SPIRITS","WINE","REFRESHMENT"), selected = c("BEER","SPIRITS","WINE","REFRESHMENT")),
                conditionalPanel("input.typeIn == 'WINE'",sliderInput("sweetnessIn","Choose the sweetness:", min=0, max=10, value=c(0,10))),
                colourInput("colorIn", "Select your preferred color.","red"),
                checkboxInput("sortpriceIn", "Sort by price from highest to lowest",value = FALSE)),
	
        dashboardBody(
                plotOutput("Hist_AlcCont"),
                br(), br(),
                textOutput("rownuberOut"),
                br(), br(),
                downloadButton("downloadOut", "Download results to .csv"),
                br(), br(),
                dataTableOutput("table_result"),
                br(), br(),
                uiOutput("URL_1"),
                uiOutput("URL_2")
                )
)
