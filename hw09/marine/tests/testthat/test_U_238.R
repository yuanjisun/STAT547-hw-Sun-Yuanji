context("Test U-238 from Pre-loaded Data")

test_that("Test the accuracy and correctness of GPS result from the pre-loaded data", {
        U_actual_1 <- 0.0786*data@data$salinity-0.315
        U_actual_2 <- 0.0713*data@data$salinity
        expect_identical(U_238(data,1, plot_it = FALSE),U_actual_1)
        expect_identical(U_238(data,2, plot_it = FALSE),U_actual_2)
        expect_identical(U_238(data,1, plot_it = FALSE),U_actual_2)
        expect_identical(U_238(data,2, plot_it = FALSE),U_actual_1)
})
