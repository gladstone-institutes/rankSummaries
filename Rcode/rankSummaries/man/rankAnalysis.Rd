\name{rankAnalysis}
\alias{rankAnalysis}
\title{Analysis of Longitudinal Data by Rank Summaries}
\usage{
  rankAnalysis(formula, data, orderedScoreNames, w = NULL) 
}
\arguments{
  \item{formula}{formula for fitting rankScores. See details. }
  \item{data}{dataset}
  \item{orderedScoreNames}{ordered names of longitudinal outcomes}
  \item{w}{weights to use. If left = NULL, flat weights are used}
}
\description{
 	Fits a rank summary model for longitudinal data. Intended for use in the analysis of Morris Water Maze experiments. 
 	
 }
 
\details{
  Compares overall performance in repeated measures performance. This is done is three steps. First, at each trial (indicated by \code{orderedScoreNames}), the observed values are replaced by their quantile score (if n = 20, subject who had the lowest score in that trial gets rank 1/20, second lowest is 2/20, etc). Next, the composite score for each subject is calculated by taking their mean quantile score over all the trials. This can be a weighted average by use of the \code{w} argument. Finally, linear regression is used to compare covariate effects. Standard errors are fixed up to account for the fact that the scores are not quite independent (they have correlation = -1/n).

	In regards to the \code{formula} argument, this should be a one sided argument, such as \code{~ group + gender}, in which we would modeling both \code{group} and \code{gender}. Formula *can* be a two sided formula, i.e. \code{y ~ group + gender}, but the response variable will be ignored (replaced with rank scores).

} 
  
\examples{
  data(MWM_data)
  outcomeNames <- names(MWM_data)[3:14]   
  #variables 3-14 in dataset correspond with outcome variables
  
  fit <- rankAnalysis(formula = ~ hAPP + cohort,
                      data = MWM_data,
                      orderedScoreNames = outcomeNames,
                      w = 1:12)
  
  summary(fit)
}
\author{
  Clifford Anderson-Bergman
}