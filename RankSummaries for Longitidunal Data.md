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

The concept that motivates the rank summary analysis is that in principle, we are asking a very simple 
question: does one group perform better than the other at this particular test? We truth, we are *not* 
interested in the actual values of the parameters that we may be estimating in the various other proposed 
models. 

With that in mind, we use a [derived variable analysis (section 1.3)](https://faculty.washington.edu/heagerty/Courses/VA-longitudinal/private/LDAchapter.pdf) to greatly simplify
the analysis. This is real a simple data transformation, rather than a novel statistical method. For this data, at each 
trial number, we replace the raw scores with the corresponding percentile rank. For example,

    SubjectID  Trial1   Trial2   Trial1_rs   Trial2_rs
    1          35.1     29.6     0.333       0.333
    2          60       45.5     0.833       1.0
    3          60       32.9     0.833       0.666

In the example above, `TrialX` is the `Xth` raw trial score, while `TrialX_rs` is the percentile rank score. In `Trial1`, note that subjects 2 and 3 both have time = 60, meaning they did not finish. This is treated as tied for last (and thus have percentile rank 2.5/3.0). 

This is calculated for each trial. Then, for each subject we calculate the average percentile rank score. This gives 
us the average percentile ranking for each subject. We can then use this as the response for any standard analysis method (i.e. t-test, linear regression, etc.). A very technical note is this does violate the assumption of independent observations, as rank scores are not independent; in fact they are correlated with $ \rho = -1/(k-1) $, where $k$ is the number of subjects. However, in practice this has very little effect on the type I error if ignored for reasonably sized groups (i.e. n = 10 per group). 
