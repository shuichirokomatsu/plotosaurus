#' A plot axis wrapper function
#'
#' This function generates an axis with a label in an exponential form, given a log-scale range.
#' @param x Vector of numbers to plot or range of the numbers
#' @param axis_ind Axis number (1: bottom, 2: left, 3: top, 4: right)
#' @param n (Rough) number of tick marks that is used to find pretty tick mark positions. (parameter for pretty())
#' @keywords plot axis
#' @export
#' @examples
#'
#'  logx=rnorm(100)
#'  logy=rnorm(100) + logx
#'  plot(logx, logy, xlab="x", ylab="y", axes=F)
#'  exp_axis(range(logx),1)
#'  exp_axis(range(logy),2)
#'  box()

exp_axis<-function(x, axis_ind, n=5){
  at=pretty(x, n)
  at_exp = sapply(at, function(xx)as.expression(bquote(10^ .(xx))))
  axis(axis_ind, at=at, label=at_exp)
}


