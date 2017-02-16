#' Function that sets a default style for plots
#'
#' This function sets par values that can be used for a default style plots.
#' @keywords plot par
#' @export
#' @return No particular return value
#' @examples
#'
#' stylefunc0()
#' hist(rnorm(100))
#'
#'
#' preset1a = get_preset(1)
#' pngpdf_preset( 
#'   list( 
#'       function(){ barplot(1:5, names.arg=c('a','b','c','d','e'),ylab="some y",xlab="some x", col=COLOR5()) }
#'    ),
#'    'test6', stylefunc0, preset1a
#' )
#'

stylefunc0<-function(){
    par(las=1, lend=2)
    par(bg='white',fg=1,col.lab=1, col.axis=1)
}
