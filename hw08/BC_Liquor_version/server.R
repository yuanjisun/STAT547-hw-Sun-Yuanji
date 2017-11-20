# Define server logic required to draw a histogram

#setwd("C:/Users/yuanj/Desktop/STAT-547M-Lecture-Notes/cm107_108_shiny_web_application_project")

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
	
	Filtered_bcl <- reactive (bcl_data %>%
		filter(Price>=input$priceIn[1], Price<=input$priceIn[2], Type %in% input$typeIn))
	        # if (is.null(nrow())) {
	        #         return(NULL)} %>%
	        # if (input$sweetnessIn){
	        #        filter(Sweetness>=input$sweetnessIn[1],Sweetness<=input$sweetnessIn[2])
	        # }
	                
	output$Hist_AlcCont <- renderPlot({
		Filtered_bcl() %>%
			ggplot() +
			aes(x = Alcohol_Content) +
			geom_histogram(fill=input$colorIn) +
	                labs(x="Alcohol content",y="Counts", title="Filtered Result")
	})
	
	output$table_result <- renderDataTable({
		Filtered_bcl()
	})
	
	output$downloadOut <- downloadHandler("Results.csv",content = function(file) {
	        write.csv(file="Filtered_bcl_download","Results")})
	
	# output$rownuberOut <- paste("We found", nrow(Filtered_bcl), "options for you.")
	
}
