## Plotosaurus


##### Note : example plots are in the 'images' directory.

### installation
     library("devtools")
     devtools::install_github("SooLee/plotosaurus")
     
     or
     
     install_url("https://github.com/SooLee/plotosarsus/archive/0.9.1.zip") ## recommended
     
### calling package before use
     library(plotsaurus)

### dependencies
     package vioplot : required for function vioplot_list.

### functions
      *Wrappers*
      template1 : This function allows a templated plot in which the legend is nicely placed outside the plot region.
      pngpdf : This function generates both png and pdf files for a given plot function.
      pngpdf.nodate : This function generates both png and pdf files for a given plot function, but not adding the date in the output file name.
      pngpdf_preset : This function takes a list of plot functions that will be passed on to pngpdf, and draws each plot within its corresponding plt region specified by a preset object.
      
      *Stypes, colors, layouts*
      get_preset : This function returns a preset object that contains a preset layout of a plot, which can be fed to the function pngpdf_preset(), to use a preselected layout for various arrangements of plots in the device.
      stylefunc0 : This function sets par values that can be used for a default style plots.
      stylefunc_blue : This function sets par values that can be used for a particular style with a blue background.
      COLOR4 : This function returns a set of 4 colors that can be used for co-plotting
      COLOR5 : This function returns a set of 5 colors that can be used for co-plotting
      COLOR3B : This function returns a set of 3 grey-scale colors that can be used for co-plotting
      
      *Higher-level plots*
      plot_rainbowlines : This function generates a single plot with multiple lines of rainbow colors, given a list of matrices(or data frames).
      enrichment_plot : This function generates two plots in one page - 1) a barplot of a series of expected and observed values with a star above significant ones, and 2) a line plot of log2(observed/expected), again with a star above significane ones. Multiple data sets can be plotted as well, optionally with a '+' above significant ones according to the combined p-value.
      
      *Lower-level plots*
      cumhist : This function either plots an unsmoothed cumulative histogram or returns a data frame that can be used to plot such a cumulative histogram.
      vioplot_list : This function generates a series of violins in one plot, given a list of numeric vectors. It requires package vioplot.

      *Plot components*
      exp_axis : This function generates an axis with a label in an exponential form, given a log-scale range.
      

### For developer
* To build, go to the `plotosaurus` directory, and open an R session.
```r
library(devtools)
document()
```



