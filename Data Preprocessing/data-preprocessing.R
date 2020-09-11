  #Import dataset
dataset=read.csv('Social_Network_Ads.csv');

  # Take care of Missing Data

# Using Average

dataset$EstimatedSalary=
  ifelse(is.na(dataset$EstimatedSalary),ave(dataset$EstimatedSalary
                                            ,FUN = function(x)mean(x,na.rm=TRUE)),dataset$EstimatedSalary)



# Using LLS Impute

#install.packages("BiocManager")
library(BiocManager)

#install.packages(pcaMethods) #installing the pcaMethods package, one time thing
library(pcaMethods) # To use knn and lls impute

#source("https://bioconductor.org/biocLite.R")
#biocLite("pcaMethods")

#install.packages('pcaMethods')  
dataset <- data.matrix(dataset)
result_lls <- llsImpute(dataset, k = 3, center = FALSE, completeObs = TRUE,
                    correlation = "pearson", allVariables = TRUE, maxSteps = 100,
                    xval = NULL, verbose = FALSE)




#Using kNN impute

#install.packages("VIM") #installing the VIM package, one time thing
library(VIM) # To use knn and lls impute

result_knn <- kNN(dataset,variable=c("EstimatedSalary"),k=5)
view(result)