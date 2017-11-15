# Load the library
library(oce)

# Plot a summary figure
ctd_data <- read.oce("CTD.cnv")
jpeg('Summary.jpg')
plot(ctd_data, which=c(1,2,3,5), fill="lightgray")
dev.off()

# Export data
save(ctd_data, file = "ctd_data.RData")

library(tidyverse)
ctd_df <- as_data_frame(ctd_data@data)

