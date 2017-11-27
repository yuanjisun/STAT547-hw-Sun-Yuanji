#' Import CTD data
#'
#' The purpose of this function is to calculate the compensation depth of a sampling site.
#'
#' @param data The raw data read from CTD file.
#'
#' @return Compensation depth in unit \code{m}.
#'
#' @details
#' This function is based on \code{read_ctd()}, which is provided in this package. After getting raw data, this function can help you quickly get the compensation depth without going through complex data set.
#'
#' @examples
#' compensation_depth(data)
#'
#' @export

compensation_depth <- function(data) {
        par_0.01 <- data@data$par[1] * 0.01
        ind <- which.min(abs(data@data$par - par_0.01))
        data@data$pressure[ind]
}
