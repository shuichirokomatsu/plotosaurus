#' Function that returns a 'preset', a list containing a preset layout of a plot.
#'
#' This function returns a preset object that contains a preset layout of a plot, which can be fed to the function pngpdf_preset(), to use a preselected layout for various arrangements of plots in the device.
#' @param n Number of plots in the figure. (default 1) Currently, only n=1-3 are available.
#' @param layout The layout number. (default ''). Currently for n=2, 'h50' (horizontal division) and 'v50' (vertical division) are available. For n=1 and n=3, only one preset is available.
#' @keywords plot layout
#' @export
#' @return a preset, list of plt vectors, width and height.
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


get_preset <- function( n=1, layout=''){

  # 1 plot in one page
  if(n==1){
    preset = list(
        plts = list(
            c(0.2,0.95,0.2,0.95)
        ),
        width=7,
        height=7
    )

  # 2 plots in one page
  } else if(n==2){

    if(layout == 'h50' ){
      preset = list(
          plts=list(
              c(0.1,0.47,0.2,0.95),
              c(0.58,0.95,0.2,0.95)
          ),
          width=12, 
          height=6
      )
    } else if(layout == 'v50' ){
      preset = list(
          plts=list(
              c(0.2,0.95,0.2,0.5),
              c(0.2,0.95,0.65,0.95)
          ),
          width=7,
          height=7
      )
    }
  
  # 3 plots in one page
  } else if(n==3){
  
    preset = list(
        plts=list(
            c(0.1,0.47,0.2,0.95),
            c(0.58,0.95,0.45,0.95),
            c(0.58,0.95,0.2,0.35)
        ),
        width=12, 
        height=6
    )
  }
  
  return(preset)
}


