#' A plot template function
#'
#' This function allows a templated plot in which the legend is nicely placed outside the plot region.
#' @param	func any plotting function.
#' @param	legend.func any non-independent function (usually legend). By non-independent, I mean that it requires a pre-existing plot call such as plot.new(). The coordinates of this function is already defined to be (0,1) for both x and y. x=0 and y=1 is a good start for the legend coordinate.
#' @param	plt this defines the plot (box) region and the legend region together. plt=c(x1,x2,y1,y2). e.g. Increase plt[3] if you run out of space for the x labels. Decrease plt[4] if you run out of space for the plot title. Defaults to c(0.2,0.95,0.4,0.9).
#' @param	legend.plt.x The plt x value that separates between the plot and legend regions. Decrease this if you run out of space for the legend.
#' @keywords plot template
#' @export
#' @return a list of the returned values from the two functions, if they exist.
#' @examples
#' # example 1
#' template1(
#'  function(){
#'    plot(1:10,1:10,type="o",pch=22, xlab="x",ylab="y")
#'    points(1:10,10:1,col=2,pch=19)
#'    points(1:10,c(9:5,5:9),col=3,pch=19)
#'  },
#'  function(){
#'    legend(0,1,c("haha"),bty="n",pch=22,lty=1,lwd=1)
#'    legend(0,0.8,c("lala","baba"),bty="n",pch=19, col=c(2,3))
#' }
#' )
#'
#' # example 2
#' template1(
#'  function(){
#'    plot(1:10,1:10,type="o",pch=22, xlab="x",ylab="y")
#'    points(1:10,10:1,col=2,pch=19)
#'    points(1:10,c(9:5,5:9),col=3,pch=19)
#'  },
#'  function(){
#'    legend(0,1,c("haha"),bty="n",pch=22,lty=1,lwd=1)
#'    legend(0,0.8,c("lala","baba"),bty="n",pch=19, col=c(2,3))
#'  },
#'  plt=c(0.2,0.95,0.2,0.9),legend.plt.x=0.8
#' )



template1<-function(func,legend.func, plt=c(0.2,0.95,0.4,0.9), legend.plt.x=0.65){
  old.plt=par("plt",no.readonly=F)
  on.exit(par(plt=old.plt))
  res=list()
  par(plt=c(plt[1],legend.plt.x, plt[3],plt[4]))
  res$func = func()
  par(plt=c(legend.plt.x, plt[2],plt[3],plt[4]),new=T)
  plot.new();plot.window(c(0,1),c(0,1))
  res$legend.func = legend.func()
  invisible(res)
}

