## Soo.plot.base


##### Note : example plots are in the 'images' directory.

### installation
     library("devtools")
     devtools::install_github("SooLee/Soo.plot.base")
     
     or
     
     install_url("https://github.com/SooLee/Soo.plot.base/archive/0.9.0.zip") ## recommended
     
### calling package before use
     library(Soo.plot.base)

### dependencies
     package vioplot : required for function vioplot_list.

### functions
      *Wrappers*
      template1 : This function allows a templated plot in which the legend is nicely placed outside the plot region.
      pngpdf : This function generates both png and pdf files for a given plot function.
      
      *Higher-level plots*
      plot_rainbowlines : This function generates a single plot with multiple lines of rainbow colors, given a list of matrices(or data frames).
      enrichment_plot : This function generates two plots in one page - 1) a barplot of a series of expected and observed values with a star above significant ones, and 2) a line plot of log2(observed/expected), again with a star above significane ones. Multiple data sets can be plotted as well, optionally with a '+' above significant ones according to the combined p-value.
      
      *Lower-level plots*
      cumhist : This function either plots an unsmoothed cumulative histogram or returns a data frame that can be used to plot such a cumulative histogram.
      vioplot_list : This function generates a series of violins in one plot, given a list of numeric vectors. It requires package vioplot.





