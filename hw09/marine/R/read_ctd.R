#' Import CTD data
#'
#' The purpose of this function is to import CTD data as an variable in R (raw_data).
#'
#' @param file The file to be read. It must be a .cnv file.
#'
#' @return A R object containing all raw data in .cnv file. This data is very complex, which needs further process.
#'
#' @details
#' Since .cnv file is quite unique and the data structure is extremely complex, this function is based on \code{read.oce()} in the package \code{oce}.
#'
#' @examples
#' raw_data("sample_CTD.cnv")
#'
#' @export

raw_data <- function(file) {
        if (substr(file, nchar(file)-3, nchar(file))==".cnv"){
                oce::read.oce(file)
        } else {
                stop("This file is not .cnv file. Please choose a valid file.")
        }
}
