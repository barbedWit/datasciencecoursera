complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        ##col_headings <- c('heading1','heading2', ....,'heading_c')
        ##names(your_dataframe) <- col_headings
        
        complete_sums<-vector('numeric')
        id_list<-vector('numeric')
        for (i in id) {
                paddedNum <- sprintf("%03d", i)
                monitorID <- as.character (paddedNum)
                monitor_frame <- read.csv(paste(directory, "/", monitorID,".csv", sep = ""))
                #identify number of complete cases in the monitor frame
                is_complete<-complete.cases(monitor_frame)
                total_complete<-sum(is_complete)
                complete_sums<- append (complete_sums, total_complete, after = length(complete_sums))
                id_list<- append(id_list, i, after = length(id_list))
        }
        returnData <-data.frame(id = id_list, nobs = complete_sums)
        returnData
                
}