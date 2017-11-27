context("Test GPS from Pre-loaded Data")

test_that("Test the accuracy and correctness of GPS result from the pre-loaded data", {
        GPS_actual <- list(longitude=data@metadata$longitude, latitude=data@metadata$latitude)
        GPS_test_1 <- list(longitude=-123.6664, latitude=49.25022)
        GPS_test_2 <- list(longitude="123 39.983 W", latitude="49 15.013 N")
        expect_identical(gps(data),GPS_actual)
        expect_identical(gps(data),GPS_test_1)
        expect_identical(gps(data),GPS_test_2)
})
