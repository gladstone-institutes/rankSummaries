\name{MWM_data}
\alias{MWM_data}
\title{Morris Water Maze Data}
\usage{data(MWM_data)}
\format{A data frame with 106 rows and 14 variables	
	\itemize{
	  \item{\code{hAPP}}{   Mouse Genotype}
	  \item{\code{cohort}}{   Cohort indicator}
	  \item{\code{LATENCY_X}}{   Latency for trial number \code{X} (ranges from 1-12)}
	  }
}
\description{
	Morris Water Maze data collected from 3 different experiments. Latency represents time until mouse finds the hidden platform. Mice are removed from maze if they fail to find the platform in 90 seconds. Each mouse was trained 12 times. 
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
\source{
}