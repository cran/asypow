\name{info.expsurv.kgroup}
\alias{info.expsurv.kgroup}
\title{
   Expected Information Matrix for a Single or Multiple Group 
   Clinical Trial with Exponential Survival
}
\description{
   Calculates expected information matrix for a single observation
   for a single or multiple group clinical trial with exponential
   survival.


   The clinical trial will accrue subjects over a time period \eqn{L}{L}.
   Each subject will enter the study at a random time between 0 
   and \eqn{L}{L}, so the subject's follow up time, \eqn{U}{U}, will be uniformly
   distributed between 0 and \eqn{L}{L}. A subject with follow up
   time \eqn{U}{U}, can die at a time \eqn{t}{t} between 0 and \eqn{U}{U}, 
   or the subject can
   be withdrawn alive at time \eqn{U}{U}. The density of time to death
   is exponential distribution with hazard, \eqn{w}{w}.
}
\usage{
   info.expsurv.kgroup(w, L, group.size=1)
}
\arguments{
\item{w}{
    Scalar  or  vector of   exponential   rates (reciprocals of  the  mean
    survival time ) for the groups. The i'th component is the (alternative
    hypothesis or true) rate of the i'th group.
}
\item{L}{
    The length of the clinical trial. If all groups have the same
    trial length, L should be a single number; otherwise, L should
    be a vector the same length as w where L[i] is the length
    of the clinical trial for the i'th group.
}
\item{group.size}{
    Needed only if there are to be several groups with unequal sample
    sizes.  The value of the i'th component is the relative sample size of
    the i'th group.  The calculation made is for a single observation
    spread over the several groups in proportion to the specified sample
    size.  If this value is specified, it should be a vector of the same
    length as lambda.
}}
\value{
    Expected information matrix for a single observation.  The matrix is
    square with dimension equal to the number of groups.
}
\references{
    Cox, D.R. and Hinkley, D.V. (1974).
    \emph{Theoretical Statistics}
    Chapman and Hall, London.
}
\seealso{
    \code{\link{info.binomial.kgroup}}, 
    \code{\link{info.poisson.kgroup}}, 
    \code{\link{info.ordinal.kgroup}}
}
\examples{
# Find the information matrix for a clinical trial of
# length 3 with hazard 1
info.expsurv <- info.expsurv.kgroup(1, 3)
print(info.expsurv)
}
\keyword{htest}
\concept{information}
% Converted by Sd2Rd version 1.21, and hand-edited. 



