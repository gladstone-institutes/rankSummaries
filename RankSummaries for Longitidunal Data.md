#Rank Summary Analysis for Longitudinal Experiments

##What type of data is this for?

This analysis method was designed specifically for Morris Water Maze data. 
In these trials, there are 2 (or more) different groups of mice. Each mouse is placed in a bowl of water with a hidden platform.
The quantitative outcome of interest is the time until they reach the platform. Note that there is a maximum time limit
(often 60 or 90 seconds) after which the mouse will be removed from the water even if the platform is not found. This is repeated
several times for each mouse. Although the first trial should be approximately random (none of the mice have any idea where the platform is), as the trials
progress, mice with impared memory should fare worse than standard mice. See the [Morris Water Maze paper](http://scholarpedia.org/article/Morris_water_maze) 
for more details.

In general, these methods can be used for **structured** longitudinal analyses (i.e. fixed number of trials per subject),
where we are interested in the overall performance at a given task. Other natural uses of the methods could T and Y-maze data. 

##Why use new methods?

There are many complications in the analysis Morris Water Maze data. This are

   1. Repeated measures per subject, i.e. correlated observations
   
   2. Censored observations when mice do not find the platform in the given amount of time
   
   3. Non-linear effects; often healthy mice learn very quickly and then have no room for improvement, 
   while unhealthy mice very gradually learn. In addition, there are several nuisance effects, 
   such as number of trials performed that day; there is often a reduction in performance
   observed at the beginning of a new day of trials
   
   4. Non constant variance; as the average time to completion reduces, so does the variance
   of time to completion. 
  
  
The original MWM methods paper suggesting using repeated measures ANOVA. While this does address the first issue,
it does not address any of the others. Several alternatives have been suggested, such as linear mixed effects models,
non-linear mixed effects models, and Cox-PH mixed effects models. While these methods are an improvement over the repeated measures ANOVA models, these methods address some, but not all of the issues. Worse yet, they require quite a bit of model diagnostics, which means these models may be difficult to use for biologists (and even a headache for statisticians). 

As such, our motivation was to create simple, valid, robust statistical methods for Morris Water Maze Data analyses. 

##What is a Rank Summary analysis?
