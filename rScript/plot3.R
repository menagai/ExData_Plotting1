########################################################################
## Exploratory Plot 3                                                 ##
##    This R script makes a plot of the energy sub metering along time##
##                                                                    ##
## objective: this create a plot with the sub metering measure in     ##
##            two days (01 and 02/02/2007), using the Individual      ##
##            household electric power consumption                    ##
##                                                                    ##
## input: Individual household electric power consumption data set    ##
##        from the repository UC Irvine Machine Learning Repository   ##
##        (household_power_consumption.txt)                           ##
##                                                                    ##
## output: plot in png file of the sub metering of energy over 01 and ##
##         02 Feb of 2007. The file have a resolution of 480X480 px   ##
##         and will be saved on the plots directory                   ##
##                                                                    ##
## author: Micael Eiji Nagai                                          ##
##                                                                    ##
## date: 04/02/2015                                                   ##
##                                                                    ##
## notes: This plot was made for the Project 1 of the coursera course ##
##        "Exploratory Data Analysis"                                 ##
########################################################################

####################################
## Check if there is a plots directory
##   to save the png file

dir <- './/plot//'
if(!file.exists(dir)){ dir.create(dir)}

#####################################
### Setting the data to make the plot

## reading the data set
dataset <- read.table( 'household_power_consumption.txt', na.strings = '?'
                     , sep = ';', header = TRUE)
## transforming the variables names to lower case
names(dataset) <- tolower(names(dataset))
## setting the variable date as a date variable
dataset$date = as.Date( dataset$date, format = "%d/%m/%Y")
## subseting the data to only those of the days 01 and 02 Feb of 2007
dataset <- dataset[dataset$date == "2007-02-01" | dataset$date == "2007-02-02",]
## setting the variable time as a time variable
dataset$time <- strptime(paste( dataset$date, dataset$time), format = "%Y-%m-%d %H:%M:%S")

###################
### Making the plot
with( dataset,{
    ## saving the plot in the plots directory with the name plot3.png
    png( paste0(dir,'plot3.png'))
    plot(time, sub_metering_1, ylim = c(0, 40), type = 'l', col = 1
       , axes = TRUE, xlab = '', ylab = 'Energy sub metering')
    par(new = TRUE)
    plot(time, sub_metering_2, ylim = c(0, 40), type = 'l', col = 2
       , axes = FALSE, xlab = '', ylab = '')
    par(new = TRUE)
    plot(time, sub_metering_3, ylim = c(0, 40), type = 'l', col = 4
       , axes = FALSE, xlab = '', ylab = '')
    legend( 'topright', legend = paste0(rep('Sub_metering_', 3),1:3), col = c(1,2,4), lty = rep(1,3))
    dev.off()
})
