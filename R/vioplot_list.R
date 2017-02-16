#' A plot function
#'
#' This function generates a series of violins in one plot, given a list of numeric vectors.
#' @param x a list of numeric vectors. If the list has names, the names will be used as labels. Otherwise 1:length(x) will be used.
#' @param horizontal if this is true, each violin is drawn horizontally, stacked vertically. If false, the other way around. Defaults to FALSE.
#' @param axes if this is true, axes will be drawn. Defaults to TRUE.
#' @param Range the range of values. This will be ylim if horizontal is false, xlim if horizontal is true. Defaults to the range of x.
#' @param add.boxplot adds boxplots on top of the violin plots if true. Defaults to FALSE.
#' @param drawRect adds thin boxplot-like rectangles on top of the violin plots if true. Defaults to TRUE.
#' @param col.vio color of violin plots. Defaults to 'light blue'.
#' @param col.box color of the boxplots. Defaults to 1 (black).
#' @param xlab x-axis label. Defaults to ''.
#' @param ylab y-axis label. Defaults to ''.
#' @param main title of the plot. Defaults to ''.
#' @keywords plot violinplot boxplot
#' @details This function requires package vioplot.
#' @import vioplot sm
#' @export
#' @examples
#'
#' # list without names
#' x=list(rnorm(1000),rnorm(1000,2,3),rnorm(1000,2,1))
#' 
#' # list with names
#' y=list(dist1=rnorm(1000),dist2=rnorm(1000,2,3),dist3=rnorm(1000,2,1))
#' 
#' par(mfrow=c(4,1))
#' vioplot_list(x,ylab="value")
#' vioplot_list(y,ylab="value",add.boxplot=TRUE, col.vio="green3", drawRect=F)
#' vioplot_list(y,ylab="value",col.vio=1,drawRect=FALSE)
#' vioplot_list(y,xlab="value",col.vio=1,drawRect=FALSE, horizontal=TRUE)
#'


vioplot_list<-function(x, horizontal=FALSE, axes=TRUE, Range=range(x,na.rm=TRUE),add.boxplot=FALSE, drawRect=TRUE, col.vio="light blue", col.box=1, xlab="",ylab="",main=""){  ## version 4

  mgp=par("mgp",no.readonly=F)

  plot.new()
  if(horizontal==FALSE) { plot.window(c(0.5,length(x)+0.5),Range,xaxs="i")
  } else {  plot.window(Range,c(0.5,length(x)+0.5),yaxs="i") }
  box()

  mtext(xlab,1,line=mgp[1])
  mtext(ylab,2,line=mgp[1])
  title(main)

  for(i in 1:length(x)){
   yy=x[[i]]
   yy=yy[which(!is.na(yy) & is.finite(yy) & !is.nan(yy))]
   vioplot(yy, col=col.vio, horizontal=horizontal, at=i, add=TRUE, border=NA, drawRect=drawRect)
   if(add.boxplot==TRUE) boxplot(yy, border=col.box, horizontal=horizontal, at=i, add=TRUE, axes=FALSE)
  }

  if(axes==TRUE){
    if(!is.null(names(x))) labels = names(x)  else labels=1:length(x)
    if(horizontal==FALSE) { axis(1,lwd=0,at=1:length(x),labels=names(x)); axis(2);
    } else { axis(2,lwd=0,at=1:length(x),labels=names(x)); axis(1); }
  }
}


