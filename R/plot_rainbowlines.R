#' A plot function
#'
#' This function generates a single plot with multiple lines of rainbow colors, given a list of matrices(or data frames).
#' @param mat.list a list of two-column matrices or two-column data frames.
#' @param samplenames a vector of names that will be used as the legend.text. The length of samplenames must be the same. If not specified, the names of mat.list will be used. Defaults to NULL.
#' @param color a vector of colors that will be used for the plots. The length of color must be the same as the length of mat.list. If not specified, rainbow colors will be used automatically. Defaults to NULL.
#' @param lwd line width.
#' @param lty line type.
#' @param xlab x-axis label. Defaults to 'x'.
#' @param ylab y-axis label. Defaults to 'y'.
#' @param main title. Defaults to ''.
#' @param cex.legend the cex of the legend. Reduce this if you run out of vertical space for legend. Defaults to 1.
#' @param template1.args list of parameters for template1(), such as legend.plt.x.
#' @param add.func an additional function to add to the plot (eg. abline).
#' @param ... other graphical parameters.
#' @keywords plot rainbow lines
#' @export
#' @importFrom grDevices rainbow
#' @return a vector of colors used.
#' @examples
#' 
#' ## example of three plots
#'
#' par(mfrow=c(3,1))
#'
#' # plot 1
#' mat.list = list("sd=1"=cumhist(rnorm(1000),plot=FALSE),"sd=2"=cumhist(rnorm(2000,sd=2),plot=FALSE))
#' plot_rainbowlines(mat.list)
#' 
#' # plot 2
#' plot_rainbowlines(mat.list,c("sd=1","sd=2"),color=c("violet","dodgerblue"),ylab="Cumulative fraction",main="Gaussian",lwd=2)
#' 
#' # plot 3
#' mat.list = lapply(1:10, function(sd) cumhist(rnorm(10000,sd=sd),plot=FALSE) )
#' legend.text = paste("sd=",1:10,sep="")
#' plot_rainbowlines(mat.list,legend.text,x="values",ylab="Cumulative fraction",main="Gaussian",template1.args=list(legend.plt.x=0.8),add.func=function(){abline(h=0.5,lty=2)})
#'

plot_rainbowlines<-function(mat.list,samplenames=NULL,color=NULL,lty=1,lwd=1,xlab="x",ylab="y",main="",cex.legend=1,template1.args=NULL,add.func=NULL,...){

 # set colors
 offset = floor(length(mat.list)/2)  ## this offset ensures that the first and last colors are not too similar.
 if(is.null(color)) color=rainbow(length(mat.list)+offset)[1:length(mat.list)]

 # plot ranges
 xlim = range(lapply(mat.list,function(xx)xx[,1]),na.rm=T)
 ylim = range(lapply(mat.list,function(xx)xx[,2]),na.rm=T)

 # get the mgp
 mgp=par("mgp",no.readonly=FALSE)

 # legend text
 if(is.null(samplenames)) samplenames=names(mat.list)
 if(is.null(samplenames)) samplenames=1:length(mat.list)


 # plot
 func <- function(){
     plot.new()
     plot.window(xlim,ylim)
     mapply(function(mat,col,lwd,lty,...){lines(mat[,1],mat[,2],col=col,lwd=lwd,lty=lty,...)},mat.list,color,lwd=lwd,lty=lty,...)
     box();axis(1);axis(2)
     mtext(xlab,side=1,line=mgp[1])
     mtext(ylab,side=2,line=mgp[1])
     title(main)
     if(!is.null(add.func)) add.func()
 }

 legend.func <- function(){
     legend(0,1,samplenames,col=color,bty="n",cex=cex.legend,xpd=T,lwd=lwd,lty=lty,...)
 }

 template1.args.all = append(list(func=func,legend.func=legend.func),template1.args)
 do.call(template1,template1.args.all)

 invisible(color)

}


