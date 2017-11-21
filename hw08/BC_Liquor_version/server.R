# Define server logic required to draw a histogram

#setwd("C:/Users/yuanj/Desktop/STAT-547M-Lecture-Notes/cm107_108_shiny_web_application_project")

library(shiny)
library(readr)
library(tidyverse)
library(readr)
library(dplyr)
library(DT)
library(ggplot2)
library(shinyjs)
library(shinydashboard)

server <- function(input, output) {
	bcl_data <- read_csv("Data/bcl-data.csv")
	
	Filtered_bcl <- reactive (
        if (input$typeIn == "WINE"){
                bcl_data %>%
                        filter(Price>=input$priceIn[1], Price<=input$priceIn[2], Type %in% input$typeIn) %>%
                filter(Sweetness>=input$sweetnessIn[1],Sweetness<=input$sweetnessIn[2])
        } else {
                bcl_data %>%
                        filter(Price>=input$priceIn[1], Price<=input$priceIn[2], Type %in% input$typeIn)
                
        }
	)
	                
	output$Hist_AlcCont <- renderPlot({
		Filtered_bcl() %>%
			ggplot() +
			aes(x = Alcohol_Content) +
			geom_histogram(fill=input$colorIn) +
	                labs(x="Alcohol content",y="Counts", title="Filtered Result")
	})
	
	output$table_result <- renderDataTable({
	        if(nrow(Filtered_bcl()) == 0) {
	                return(NULL)
	                }
	        else{
		        if(input$sortpriceIn) {
		                Filtered_bcl() %>%
		                        arrange(-Price)
		        } else {
		                Filtered_bcl()
		}
	        }
	        
	})
	
	output$downloadOut <- downloadHandler(
	        filename = function(){
	                paste("Results",".csv",sep = "")
	                },
	        content = function(con) {
	          write_csv(Filtered_bcl(), con)
	        }
	        )
	
	output$rownuberOut <- renderText(paste("We found", nrow(Filtered_bcl()), "options for you."))
	
}


