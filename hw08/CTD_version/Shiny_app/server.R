library(readr)
library(tidyverse)
library(readr)
library(dplyr)
library(DT)
library(ggplot2)
library(shinyjs)
library(readxl)
library(shinydashboard)

# Define server logic required to draw a histogram
server <- function(input, output) {
        
        CTD_Data <- read_excel("CTD_Data.xlsx", sheet = "Sheet1")
        
        filtered_data <- reactive(CTD_Data %>%
                filter(Depth>=input$depthIn[1], Depth<=input$depthIn[2]))
        
        output$figure_1 <- renderPlot({
                filtered_data() %>%
                        ggplot() +
                        aes_string(x = input$typeIn, y="-Depth") +
                        geom_point(colour=input$colorIn) +
                        labs(y="Depth (m)", title="Depth profile")
        })
        
        output$table <- renderDataTable({
        	if (input$sortDepthIn){
        		filtered_data() %>%
        			arrange(-Depth)
        	}
        	else {
        		filtered_data()
        	}
                
        })
        
        output$download_data_Out <- downloadHandler(
        	filename = "Results.csv",
        	content = function(file) {
        		write.csv(filtered_data(), file)
        	}
        )
}
