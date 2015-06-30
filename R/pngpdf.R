#' A plot wrapper function.
#'
#' This function generates both png and pdf files for a given plot function.
#' @param plot.func Any plotting function.
#' @param fprefix The output png and pdf file path prefix. The file names will be fprefix.date.png and fprefix.date.pdf (date: eg.20150331)
#' @param width The width of the png and pdf file in inches. Defaults to 7.
#' @param height The height of the png and pdf file in inches. Defaults to 7.
#' @param pointsize The pointsize of the png and pdf files.
#' @param add.date If this is true, the output file names will be fprefix.date.png and fprefix.date.pdf (date: eg.20150331). If this is false, they will be fprefix.png and fprefix.pdf. Defaults to TRUE.
#' @param skip.png If this is true, only pdf file will be generated. Defaults to FALSE.
#' @param nplots The number of plots to be included in one page of the png file, stacked vertically. This is useful when producing a multi-page pdf file, since png does not support multi-page plotting. Each plot in the pdf and png files will not look exactly the same, so it is generally recommended to produce a single-page pdf and png. If nplots is larger than 6, it may not be able to generate a png file. In that case, try lowering png.res (resolution). Defaults to 1.
#' @param png.res The resolution of png. Defaults to 600.
#' @keywords plot png pdf
#' @export
#' @return the returned value from plot.func will be returned.
#' @examples
#'
#' pngpdf(function(){
#'   plot(1:10,1:10,type="o",pch=19,col=3)
#' },"myplot")
#'


pngpdf<-function(plot.func,fprefix,width=7,height=7,pointsize=12,add.date=TRUE,skip.png=FALSE,nplots=1,png.res=600){

  if(add.date==TRUE){ date.tag=paste(".",gsub("-","",Sys.Date()),sep="")  ## eg. ".20141209"
  } else { data.tag="" }

  if(skip.png==FALSE){
    png(paste(fprefix,date.tag,".png",sep=""),width=width,height=height*nplots,pointsize=pointsize*(nplots^0.3),unit="in",res=png.res)
    par(mfrow=c(nplots,1))
    plot.func()
    dev.off()
  }

  pdf.options(useDingbats=FALSE)
  pdf(paste(fprefix,date.tag,".pdf",sep=""),width=width,height=height,pointsize=pointsize)
  return.value = plot.func()
  dev.off()

  invisible(return.value)
}


