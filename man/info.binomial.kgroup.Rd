\name{info.binomial.kgroup}
\alias{info.binomial.kgroup}
\title{
   Expected Information Matrix for Single or Multiple Group Binomial
}
\description{
   Calculates expected information matrix for a single observation
   for single or multiple group binomial distribution.


   The natural null hypothesis for a single group is that that the probability
   is some specified value.  For multiple groups, the natural null hypothesis
   is that the group probabilities are the same.
}
\usage{
   info.binomial.kgroup(p, group.size=1)
}
\arguments{
\item{p}{
    Scalar or vector of probability values.  The i'th component is the
    (alternative hypothesis or true) probability of an event in the i'th
    group.
}
\item{group.size}{
    Needed only if there are several groups with unequal sample
    sizes.  The value of the i'th component is the relative sample size of
    the i'th group.  The calculation made is for a single observation
    spread over the several groups in proportion to the specified relative
    sizes.  If this value is specified, it should be a vector whose
    length is the same as  p.  
}}
\value{
   Expected information matrix for a single observation.  The matrix is
   square with each dimension the number of groups.
}
\references{
    Cox, D.R. and Hinkley, D.V. (1974).
    \emph{Theoretical Statistics}
    Chapman and Hall, London.
}
\seealso{
    \code{\link{info.poisson.kgroup}}, 
    \code{\link{info.ordinal.kgroup}}, 
    \code{\link{info.expsurv.kgroup}}
}
\examples{
# Find the information matrix for a 2 sample binomial with
# probability of events .2 and .4 and sample sizes 10 and 11
info.binom <- info.binomial.kgroup(c(.2,.4), c(10,11))
print(info.binom)
}
\keyword{htest}
\concept{information}
% Converted by Sd2Rd version 1.21.



