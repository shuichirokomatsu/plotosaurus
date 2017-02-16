#' A wrapper function for pngpdf().
#'
#' This function generates both png and pdf files for a given plot function, but not adding the date in the output file name.
#' @param plot.func Any plotting function.
#' @param ... Other parameters to pass on to pngpdf.
#' @keywords plot png pdf
#' @export
#' @return the returned value from plot.func will be returned.
#' @examples
#'
#' pngpdf.nodate(function(){
#'   plot(1:10,1:10,type="o",pch=19,col=3)
#' },"myplot")
#'

pngpdf.nodate <- function(plot.func, ...) pngpdf(plot.func, ..., add.date=FALSE)


