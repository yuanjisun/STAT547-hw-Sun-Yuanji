# Define UI for application that draws a histogram
ui <- fluidPage(
	
	# Application title
        titlePanel("Homework 8: BC Liquor Store Version"),
	
        sidebarPanel("Data Selection Criteria",
                img(src = "BC_liquor.jpg", width = "100%"),
                sliderInput("priceIn","Price of booze", min=0, max=300, value=c(10,20), pre = "CAD"),
                radioButtons("typeIn", "What type of booze?", choices = c("BEER","SPIRITS","WINE","REFRESHMENT"), selected="SPIRITS"),
                colourInput("colorIn", "what is your preferred color?","red")),
	
	mainPanel(plotOutput("Hist_AlcCont"),
                br(),br(),
                downloadButton("downloadOut", "Download result to .csv"),
                br(),br(),
                dataTableOutput("table_result"))
)