#' Import CTD data
#'
#' The purpose of this function is to get GPS information from CTD data.
#'
#' @param data The raw data read from CTD file.
#'
#' @return A list containing both longitude and latitude of the sampling site.
#'
#' @details
#' This function is based on \code{read_ctd()}, which is provided in this package. After getting raw data, this function can help you quickly get the GPS data without going through complex data set.
#'
#'
#' @examples
#' gps(data)
#'
#' @export

gps <- function(data){
        list(longitude=data@metadata$longitude, latitude=data@metadata$latitude)
}
