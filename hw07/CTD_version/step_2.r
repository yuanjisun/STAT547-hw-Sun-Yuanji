library(oce)
load("ctd_data.RData")

# Figure 1
jpeg('Pressure_Scan.jpg')
plotScan(ctd_data)
dev.off()

# Figure 2
Density <- swSigma(ctd_data[["salinity"]],ctd_data[["temperature"]],ctd_data[["pressure"]])
Pressure <- ctd_data[["pressure"]]
jpeg('Density_Pressure.jpg')
plot(Density, Pressure)
dev.off()


