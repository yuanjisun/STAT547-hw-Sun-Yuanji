# Define UI for application that draws a histogram
ui <- fluidPage(
        
        # Application title
        titlePanel("Homework 8: CTD Data Version"),
        
        # Side Panel
        sidebarPanel("Data Selection Criteria",
                     img(src = "ocean_map.jpg", width = "100%"),
                     sliderInput("depthIn","Choose the depth range:", min=1, max=306, value=c(1,306), post =  " m"),
                     radioButtons("typeIn", "Which measurement do you need?", choices = c("Temperature","Conductivity","Beam Transmission","Fluorescence", "Oxygen", "PAR/Irradiance", "Salinity"), selected="Temperature"),
                     colourInput("colorIn", "what is your preferred color?","red")),
        
        # Main panel
        mainPanel(plotOutput("figure_1"),
                  br(),br(),
                  downloadButton("downloadOut", "Download result to .csv"),
                  br(),br(),
                  dataTableOutput("table"))
)

