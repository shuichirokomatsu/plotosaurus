#' A plot function
#'
#' This function generates two plots in one page - 1) a barplot of a series of expected and observed values with a star above significant ones, and 2) a line plot of log2(observed/expected), again with a star above significane ones. Multiple data sets can be plotted as well, optionally with a '+' above significant ones according to the combined p-value.
#' @param mat.list a list of matrices or data frames. Each matrix/data.frame must contain at three columns, each representing observed value, expected value and p-value. All the matrices/data frames must have the same number of rows.
#' @param exp.col the name or index of the column representing expected value. Defaults to 'exp'.
#' @param obs.col the name or index of the column representing observed value. Defaults to 'obs'.
#' @param pval.col the name or index of the column representing expected value. Defaults to 'pval'.
#' @param combined.pval a vector of p-values. If provided, significant ones will be marked with '+'.
#' @param pval.thres p-value threshold for calling significant. Defaults to 0.05.
#' @param ylab y-axis label. Defaults to ''.
#' @param scale.expansion a graphical parameter that extends y-axis so that '*' and '+' can be displayed. Defaults to 1.1.
#' @param bar.color a vector of two elements, each representing the color of expected and observed. Defaults to c("indianred1","violetred").
#' @param ratio.color a vector of k elements, where k must be at least the length of mat.list (number of groups). Defaults to c("dodgerblue","red","gold","green3")
#' @param class.space spacing between groups for the ratio plot when multiple groups are plotted. Defaults to 0.5.
#' @keywords plot enrichment barplot p-value pvalue
#' @export
#' @examples
#'
#' # example 1 (multiple groups, with combined p-values)
#' mat1=data.frame(exp=c(2,3,4,1),obs=c(1.9,3,4.1,1.2),pval=c(0.1,0.2,0.02,0.002))
#' mat2=data.frame(exp=c(2,2.5,5,2.2),obs=c(1.9,2.6,5.2,2),pval=c(0.3,0.1,0.02,0.3))
#' mat3=data.frame(exp=c(3,2,1.2,2),obs=c(2.8,2,1.3,2),pval=c(0.5,0.2,0.01,0.6))
#' mat.list=list(early=mat1,mid=mat2,late=mat3)
#' combined.pval=c(0.2,0.5,0.01,0.6)
#' enrichment_plot(mat.list, combined.pval=combined.pval)
#'
#' # example 2 (one group, without combined p-values)
#' mat1=data.frame(exp=c(2,3,4,1),obs=c(1.9,3,4.1,1.2),pval=c(0.1,0.2,0.02,0.002))
#' mat.list0= list(early=mat1)
#' enrichment_plot(mat.list0)
#'


enrichment_plot <- function( mat.list, exp.col="exp",obs.col="obs",pval.col="pval", combined.pval=NULL, pval.thres=0.05, ylab="", scale.expansion=1.1,bar.color=c("indianred1","violetred"),ratio.color=c("dodgerblue","red","gold","green3"), class.space=0.5){

   if(length(ratio.color)<length(mat.list)) stop("The length of ratio.color must be at least the length of mat.list")

   ngroups = nrow(mat.list[[1]])
   mat = do.call(rbind, mat.list)[,c(exp.col,obs.col)]
      
   par(mfrow=c(2,1))
   
   ## barplot
   template1(
      function(){
      
      
        ylim=c(0,max(mat,na.rm=T))
        new.ylim.len = (ylim[2]-ylim[1])*scale.expansion
        ylim = c(ylim[1],ylim[1]+new.ylim.len)
      
      
        bar.space= c(c(0.2,0),rep(c(rep(c(0.2,0),ngroups-1),c(1,0)),length(mat.list)-1),rep(c(0.2,0),ngroups-1))
        mp = barplot(t(mat),beside=T,space=bar.space,las=2,ylab=ylab,ylim=ylim,col=bar.color)
      
        L=0
        for(i in 1:length(mat.list)){
          x=mat.list[[i]]
          if(nrow(x)!=ngroups) stop("all the matrices in the list must have the same number of rows.")
          points(mp[2,L+1:ngroups],ifelse(x[1:ngroups,pval.col]<pval.thres,x[1:ngroups,obs.col]+new.ylim.len*0.03,NA),pch="*")
          if(!is.null(combined.pval)) points(mp[2,L+1:ngroups],ifelse(combined.pval<pval.thres,x[1:ngroups,obs.col]+new.ylim.len*0.06,NA),pch="+")
          L= L + ngroups
        }
       
      },
      function(){
        legend(0,1,c("expected","observed"),pt.bg=bar.color,pch=22,bty="n")
        if(!is.null(combined.pval)) { legend(0,0.75,paste(c("individual p<","combined p<"),pval.thres,sep=""),pch=c("*","+"),bty="n")
        } else { legend(0,0.75,c("p<0.05"),pch=c("*"),bty="n") }
      }
   )
   
   
   
   ## ratio plot
   template1(
      function(){
         ratio = log2(mat[,obs.col]/mat[,exp.col])
         ylim=range(ratio)
         new.ylim.len = (ylim[2]-ylim[1])*scale.expansion
         ylim = c(ylim[1],ylim[1]+new.ylim.len)
      
         L=0
         space=0
         xval=1:ngroups
      
         if(length(mat.list)>1){
          for(i in 1:(length(mat.list)-1)){
            space=class.space
            L=L+ngroups
            xval = c(xval,c(1:ngroups+L+space*i))
          }
         }
         plot(xval,ratio,ylab="log2(observed/expected)",ylim=ylim,xlab="",col=rep(ratio.color,each=ngroups),pch=19,axes=F);box();axis(2);axis(1,labels=rownames(mat),at=xval,las=2)
      
         L=0
         for(i in 1:length(mat.list)){
          x=mat.list[[i]]
          lines(xval[1:ngroups+L],ratio[1:ngroups+L],col=ratio.color[i])
          points(xval[L+1:ngroups],ifelse(x[1:ngroups,pval.col]<pval.thres,ratio[1:ngroups+L]+new.ylim.len*0.05,NA),pch="*")
          if(!is.null(combined.pval)) points(xval[L+1:ngroups],ifelse(combined.pval<pval.thres,ratio[1:ngroups+L]+new.ylim.len*0.09,NA),pch="+")
          L=L+ngroups
         }
      
      },
      function(){
         legend(0,1,names(mat.list),col=ratio.color[1:length(mat.list)],pch=19,bty="n")
         if(!is.null(combined.pval)) { legend(0,1-0.1*length(mat.list)-0.05,paste(c("individual p<","combined p<"),pval.thres,sep=""),pch=c("*","+"),bty="n")
         } else { legend(0,1-0.1*length(mat.list)-0.05,c("p<0.05"),pch=c("*"),bty="n") }
      }
   )
   
}

