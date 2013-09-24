\name{info.poisson.kgroup}
\alias{info.poisson.kgroup}
\title{
    Expected Information Matrix for Single or Multiple Group Poisson
}
\description{
    Calculates expected information matrix for a single observation
    for single or multiple group Poisson distribution.

   The natural null hypothesis for a single group is that that the mean
   is some specified value.  For multiple groups, the natural null hypothesis
   is that the group means are the same.
}
\usage{
   info.poisson.kgroup(lambda, group.size=1)
}
\arguments{
\item{lambda}{
   Scalar or vector of Poisson means for the groups.  The i'th component
   is the (alternative hypothesis or true) mean of the i'th group.
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
   \code{\link{info.ordinal.kgroup}}, 
   \code{\link{info.expsurv.kgroup}}
}
\examples{
# Find the information matrix for a 3 sample Poisson with
# means 1, 2 and 3 and equal sample sizes
info.pois <- info.poisson.kgroup(c(1,2,3))
print(info.pois)
}
\keyword{htest}
\concept{information}
% Converted by Sd2Rd version 1.21.   

