#' A color function
#'
#' This function returns a set of colors that can be used for co-plotting
#' @keywords plot color
#' @export
#' @return No particular return value
#' @examples
#'
#' barplot(1:4, names.arg=c('a','b','c','d'),ylab="some y",xlab="some x", col=COLOR4())
#'
#' preset3a = get_preset(3)
#' pngpdf_preset(
#'   list(
#'       function(){barplot(1:4, names.arg=c('a','b','c','d'),ylab="some y",xlab="some x", col=COLOR4())},
#'       function(){plot(1:100,1:100,pch=19, type='o', xlab="")},
#'       function(){plot(rnorm(100),type='h')}
#'   ),
#'   'test5', stylefunc_blue, preset3a
#' )
#'


COLOR4 <-function() { c('dark violet','dodgerblue2','mediumseagreen','lightcoral') }

