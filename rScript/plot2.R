########################################################################
## Exploratory Plot 2                                                 ##
##    This R script makes a plot of the global active power along time##
##                                                                    ##
## objective: this create a comsumption plot along two days, using    ##
##            the Individual household electric power consumption     ##
##                                                                    ##
## input: Individual household electric power consumption data set    ##
##        from the repository UC Irvine Machine Learning Repository   ##
##        (household_power_consumption.txt)                           ##
##                                                                    ##
## output: plot of the global active power over 01 and 02 Feb of 2007 ##
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
    ## saving the plot on a directory plots with the name plot2.png
    png( paste0(dir,'plot2.png'))
    plot(time, global_active_power, xlab = '', ylab = 'Global Active Power (Kilowatts)', type = 'l')
    dev.off()
 })
