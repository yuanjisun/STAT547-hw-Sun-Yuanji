#' Import CTD data
#'
#' The purpose of this function is to calculate Uranium-238 activity in the seawater.
#'
#' @param data The raw data read from CTD file.
#' @param equation Specify which method to be used in this calculation. The default value 1 refers to Owen's equation. Another option, 2, is Pates' equation.
#' @param plot_it TRUE/FALSE. TRUE means a depth profile of U-238 will be generated. FALSE means no figure will be generated.
#'
#' @return A list containing Uranium-238 activity in unit \code{dpm/L} and the depth profile figure. By default, the figure will be denerated
#'
#' @details
#' This function is based on \code{read_ctd()}, which is provided in this package. After getting raw data, this function can help you quickly get the Uranium-238 activity without going through complex data set.
#'
#' @examples
#' U_238(data, 1, FALSE)
#'
#' @export

U_238 <- function(data, equation = 1, plot_it = TRUE) {
        stopifnot(is.numeric(equation))
        if (equation==1){
                U_238 <- 0.0786*data@data$salinity-0.315
                if (plot_it){
                        fig <- ggplot2::qplot(U_238, -data@data$pressure)
                        return(list(U_238,fig))
                } else {
                        return(U_238)
                }
        } else if (equation==2){
                U_238 <- 0.0713*data@data$salinity
                if (plot_it){
                        fig <- ggplot2::qplot(U_238, -data@data$pressure)
                        return(list(U_238,fig))
                } else {
                        return(U_238)
                }
        } else{
                stop('Please choose a valid equation, either 1 (by Owen) or 2 (by Pates). By default, 1 is selected.')
        }
}



