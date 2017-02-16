#' Function that sets a style for plots with a blue background
#'
#' This function sets par values that can be used for a particular style with a blue background.
#' @keywords plot par blue
#' @export
#' @return No particular return value
#' @examples
#'
#' stylefunc_blue()
#' hist(rnorm(100))
#'
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

stylefunc_blue<-function(){
    par(las=1, lend=2)
    par(bg='blue4',fg='white',col.lab='white', col.axis='white')
}


