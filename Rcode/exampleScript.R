####		USING RANK SUMMARY ANALYSIS

####		These first few lines are just a way to install the package off gitHub
####		This can actually be simplified by having it distributed on CRAN, 
####		but I'd prefer to wait until we're sure that's what we want to do

install.packages('devtools')		
library(devtools)
#r-package that lets you get other packages off gitHub
#takes a minute to install	



install_github('pistacliffcho/rankSummaries/rankSummaries')	
#grabs our package off gitHub
#if we put the package on CRAN, 
#the last 3 lines would be replaced with
#install.packages('rankSummaries')	
#all this only needs to be done once

															
library(rankSummaries)			
#needs to be done each time we open R to use these tools

data(MWM_data)					
#loads our mice latency dataset, which is currently included in package.
#We might not want to include the data?

head(MWM_data)
#Just giving you a snapshot of what the data looks like

responseNames <- paste0('LATENCY_', 1:12)	
# this constructs all the variable names for our response,
# i.e. LATENCY_1, LATENCY_2, etc.


fit <- rankAnalysis(formula = ~ hAPP + cohort,		 
					data = MWM_data,					
					orderedScoreNames = responseNames, 
					w =  1:12)
					
					
#Above is the call that fits our model. 

# formula is how we tell it to adjust for variables
# it needs to be written as
#			~ variable1 + variable2 + etc...
# so here we've told it that we have covariates hAPP (main effect of interest)
# and cohort (percesion variable)

# data tells the function what data set to use

# orderedScoreNames tells the function what the ordered names will be

# w tells the function what weights to use. If left blank, flat weights will be used
					
summary(fit)			
#Here's our results


# In addition, we can get information about our function by the following:
?rankAnalysis

#the help file is very minimal at this point, as you can see