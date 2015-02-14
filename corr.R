corr <- function(directory, threshold = 0) {
        ## function should take a directory of data files and a threshold
        ## for complete cases and calculate the correlation between
        ## sulfate and nitrate for monitor locations where the number
        ## of completely observed cases (on all variables) is greater than
        ## the threshold
        
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        file_frame<-complete(directory, id = 1:332)
        nobs_vector <- as.numeric(file_frame$nobs)
        ids <- as.numeric(file_frame$id)
        
        for (i in ids) {
                if(nobs_vector[i] > threshold){
                        paddedNum <- sprintf("%03d", i)
                        monitorID <- as.character (paddedNum)
                        monitor_frame <- read.csv(paste(directory, "/", monitorID,".csv", sep = ""))
                        #read in nitrate and sulfate measurements as numeric vectors
                        nitr<-as.numeric(monitor_frame$nitrate)
                        sulf<-as.numeric(monitor_frame$sulfate)
                        #calculate correlation between sulfate and nitrate
                        correlation<-cor(sulf, nitr, use = "complete.obs", method = c("pearson", "kendall", "spearman"))
                }       
  
        }
}