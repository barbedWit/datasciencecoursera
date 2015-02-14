#examples of syntax

#get working directory
getwd()
#set working directory
setwd()
#for: execute a loop a fixed number of times
x<-c("a", "b", "c", "d")
for(i in 1:14){
  print(x[i])
}

for (i in seq_along(x)){
  print(x[i])
}

for(letter in x){
  print(letter)
}
#if, else :testing a condition
if(<condition>){
  ##do something
} else if {
  ##do something different
} else {
  ##do another different thing
}

#while: execute a loop while a condition is true
count<-0
while (count<10){
  print(count)
  count<-count+ 1
}
#repeat: execute an infinite loop
#break: break the execution of a loop

#next: skip an iteration of a loop
for(i in i:100){
  if (i<=20){
    ##Skip the first 20 iterations
    next
  }
  #Do something here
}
#return: exit a function

#Writing your first function
add2<-function(x,y){
  x+y
}
#Note: in any R function, the function will return whatever the last expression is.
above10 <- function(x){
  use <- x>10
  x[use]
}

#specifying default value of 10 for n
above <- function(x, n=10){
  #this is an example of subsetting x
  use <- x>n
  x[use]
}
# first function -- columnmean
columnmean <- function (databloc, removeNA = TRUE){
  #common to add removeNA as an option for functions
  #calculate how many columns the input data bloc has
  numCol <- ncol(databloc)
  #initialize a vector with numCol elements
  means <- numeric(numCol)
  #loop through each column of the data bloc and find its mean
  for(i in 1:numCol){
    means[i] <-mean(y[,i], na.rm = removeNA)
  }
  #return means, since means is the last expression
  means
}
#Basics of writing funcitons
# Functions in R are created using the function() directive, 
# and are stored as R objects of class "function".

#Functions can be passed as arguments to other functions.
#Functions can be nested, so that you can define a function inside of another function..
#Formal arguments -- args included in function definition
# the formal() function lists all the formal arguments of a specified function
# R functions' arguments can be matched positionally or by name.
# Function arguments can also be partially matched (useful for interactive work)
