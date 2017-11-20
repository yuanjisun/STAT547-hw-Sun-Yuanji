# Define server logic required to draw a histogram

#setwd("C:/Users/yuanj/Desktop/STAT-547M-Lecture-Notes/cm107_108_shiny_web_application_project")

library(readr)
library(tidyverse)
library(readr)
library(dplyr)
library(DT)
library(ggplot2)
library(shinyjs)

server <- function(input, output) {
	bcl_data <- read_csv("Data/bcl-data.csv")
	
	Filtered_bcl <- reactive (bcl_data %>%
		filter(Price>=input$priceIn[1], Price<=input$priceIn[2], Type==input$typeIn))
	
	output$Hist_AlcCont <- renderPlot({
		Filtered_bcl() %>%
			ggplot() +
			aes(x = Alcohol_Content) +
			geom_histogram(fill=input$colorIn)
	})
	
	output$table_result <- renderDataTable({
		Filtered_bcl()
	})
	
	output$downloadOut <- downloadHandler("Results.csv",content = function(file) {
	        write.csv(Filtered_bcl_download,"Results")})
	
	
	
	
	
}
