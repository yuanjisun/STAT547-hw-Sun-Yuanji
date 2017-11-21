# Define UI for application that draws a histogram
library(shiny)
library(shinyjs)
library(shinydashboard)

ui <- dashboardPage(
        
        # Application title
	dashboardHeader(title="Homework 8: CTD Data Version", titleWidth = 400),
        
        # Side Panel
	dashboardSidebar(
		"Data Selection Criteria",
		width = 400,
		img(src = "ocean_map.jpg", width = "100%"),
		sliderInput("depthIn","Choose the depth range:", min=1, max=306, value=c(1,306), post =  " m"),
		radioButtons("typeIn", "Which measurement do you need?", choices = c("Temperature","Conductivity","Beam_Transmission","Fluorescence", "Oxygen", "PAR_Irradiance", "Salinity"), selected="Temperature"),
		colourInput("colorIn", "what is your preferred color?","red"),
		checkboxInput("sortDepthIn", "Sort by depth from highest to lowest value",value = FALSE)),

        
        # Main panel
	dashboardBody(
		plotOutput("figure_1"),
		br(),br(),
		downloadButton("download_data_Out", "Download data to file"),
		br(),br(),
		dataTableOutput("table"))
)

