# Define UI for application that draws a histogram
ui <- fluidPage(
        
        # Application title
        titlePanel("Homework 8: CTD Data Version"),
        
        # Side Panel
        sidebarPanel("Data Selection Criteria",
                     img(src = "ocean_map.jpg", width = "100%"),
                     sliderInput("depthIn","Choose the depth range:", min=1, max=306, value=c(1,306), post =  " m"),
                     radioButtons("typeIn", "Which measurement do you need?", choices = c("Temperature","Conductivity","Beam_Transmission","Fluorescence", "Oxygen", "PAR_Irradiance", "Salinity"), selected="Temperature"),
                     colourInput("colorIn", "what is your preferred color?","red")),
        
        # Main panel
        mainPanel(plotOutput("figure_1"),
                  br(),br(),
        	  downloadButton("download_data_Out", "Download data to file"),
                  br(),br(),
                  dataTableOutput("table"))
)

