#' Function that wraps pngpdf using a 'preset', to create a figure with a specific predefined layout.
#'
#' This function takes a list of plot functions that will be passed on to pngpdf, and draws each plot within its corresponding plt region specified by a preset object.
#' @param plotfuncs List of plot functions.
#' @param name The prefix of the output png or pdf file.
#' @param stylefunc A style function that sets up graphic parameters. (default: stylefunc0)
#' @param preset A preset object with the same number of plts as the number of plot functions. (default: get_preset(length(plotfuncs)), works only up to 3 plots with the default.)
#' @param ... Other parameters to be passed on to pngpdf()
#' @keywords plot layout
#' @export
#' @return No particular return value
#' @examples
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
#'
#' preset1a = get_preset(1)
#' pngpdf_preset( 
#'   list( 
#'       function(){ barplot(1:5, names.arg=c('a','b','c','d','e'),ylab="some y",xlab="some x", col=COLOR5()) }
#'    ),
#'    'test6', stylefunc0, preset1a
#' )
#'

pngpdf_preset<-function (plotfuncs, name, stylefunc=stylefunc0, preset=get_preset(length(plotfuncs)), ...) 
{
    pngpdf(function() {
        retn=list()
        stylefunc()
        par(plt = preset$plts[[1]])
        retn[[1]] = plotfuncs[[1]]()
        if (length(plotfuncs) > 1) {
            for (i in 2:length(plotfuncs)) {
                par(new = T, plt = preset$plts[[i]])
                retn[[i]] = plotfuncs[[i]]()
            }
        }
        return(retn);
    }, name, width = preset$width, height = preset$height, ...)
}
