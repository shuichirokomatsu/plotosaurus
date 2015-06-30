#' A plot function
#'
#' This function either plots unsmoothed cumulative histogram or returns a data frame that can be used to plot such a cumulative histogram.
#' @param x a numeric vector.
#' @param plot If this value is true, a plot will be generated. If false, it will return a data frame in which x is the values in the input and cdf is the cumulative fraction.
#' @param type type of the plot. It is highly recommended not to use 'p','b' or 'o' if your data is very large. Defaults to 'l'.
#' @param ylab ylab. Defaults to 'Cumulative fraction".
#' @param ... Additional plotting parameters.
#' @return if plot=FALSE, then a data frame is returned. (see argument: plot)
#' @seealso ecdf {stats}
#' @examples
#'
#' # example 1
#' cumhist(rnorm(1000))
#' 
#' # example 2
#' x = cumhist(rnorm(1000),plot=F)
#' y = cumhist(runif(1000,-2,2),plot=F)
#' plot(x,type="l",col=1)
#' lines(y,col=2)
#'

cumhist<-function(x,plot=TRUE,type='l',ylab="Cumulative fraction",...){
  X=x[order(x)]
  Y=1:length(x)/length(x)
  if(plot==FALSE) { data.frame(x=X,cdf=Y)
  } else { plot(X,Y,type=type,ylab=ylab,...) }
}


