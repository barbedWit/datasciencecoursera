pollutantmean <- function(directory, pollutant,id = 1:332){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the csv files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate". 
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list 
  ## in the 'id' vector (ignoring NA values)
  
  ## data files have these column names:
  ## "Date" "sulfate" "nitrate" "ID"
  
  ## for each monitor file in the range specified by id:
  ## read in the data under the column specified by 'pollutant'
  ## and append it to the total_readings numeric vector
        total_readings<-vector('numeric')
        for (i in id) {
                paddedNum <- sprintf("%03d", i)
                monitorID <- as.character (paddedNum)
                monitor_frame <- read.csv(paste(directory, "/", monitorID,".csv", sep = ""))
                pollutant_col <- monitor_frame[,pollutant]
                total_readings <- append (total_readings, pollutant_col, after = length(total_readings))
        }
  ## take the mean of the total_readings numeric vector, disregarding the NA values.
        mean_reading <- mean(total_readings, trim = 0, na.rm = TRUE)

  ## return that mean
  ## must round to 4 significant digits to absolutely match example output.
  ## not sure if that's necessary, but doing so for now.
        signif(mean_reading, digits = 4) 
}