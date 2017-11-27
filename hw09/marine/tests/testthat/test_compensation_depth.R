context("Test Compensation Depth from Pre-loaded Data")

test_that("Test the accuracy and correctness of compensation depth from the pre-loaded data", {
        cd_actual <- 32
        cd_test_1 <- 31
        cd_test_2 <- 33
        expect_identical(compensation_depth(data),cd_actual)
        expect_identical(compensation_depth(data),cd_test_1)
        expect_identical(compensation_depth(data),cd_test_2)
})
