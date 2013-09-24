\name{info.poisson.design}
\alias{info.poisson.design}
\title{
    Expected Information Matrix for a Poisson Design
}
\description{
    Calculates the expected information matrix for a Poisson
    design where the parameter \eqn{\lambda}{lambda}, the mean of the
    distribution, depends on a covariate, \eqn{x}{x}, via the exponentiation
    of a linear or quadratic function of \eqn{x}{x}, 
    \eqn{\lambda = \exp(a + b x)}{lambda = exp(a + b*x)}
    or 
    \eqn{\lambda = \exp(a + b x + c x^2)}{lambda = exp(a + b*x + c*x^2)}.
}
\usage{
    info.poisson.design(model="linear", theta, xpoints,
                           natx=1, group.size=1)
}
\arguments{
\item{theta}{
    Matrix of parameters for the linear combination of the covariate
    x. Each row represents a group so theta[i,] = c(a,b)
    if model = "linear" or theta[i,] = c(a,b,c) if model = "quadratic".
}
\item{xpoints}{
    Matrix of covariate values for each group. If there is only
    1 group or all groups have the same covariate value, xpoints
    should be a vector; otherwise, the number of rows in xpoints
    must each the number of rows in theta.
}
\item{model}{
    One of \{"linear", "quadratic"\}. Specifies the function
    of the covariate x that will be used.
    Linear indicates, 
    \eqn{u = a + b x}{u = a + b*x}, and
    quadratic indicates, 
    \eqn{u = a + bx + c x^2}{u = a + b*x + c*x^2}.
    Only enough to ensure a unique match need be supplied.
}
\item{natx}{
    Needed only if there are unequal sample sizes used at any of the values
    in xpoints. At covariate value xpoint[i,j] there are natx[i,j] observations.
    If specified, the dimensions of natx should be the same as the
    dimensions of xpoints.
}
\item{group.size}{
    Needed only if there are to be several groups with unequal sample
    sizes.  The value of the i'th component is the relative sample size of
    the i'th group.  The calculation made is for a single observation
    spread over the several groups in proportion to the specified relative
    sizes.  If this value is specified, it should be a vector whose
    length is the same as the number of columns in theta.
}}
\value{
    The information matrix for one observation for this design.

    If model = "linear" and there are k groups, the information
    matrix is a square 
    \eqn{(2 k)\times (2 k)}{(2*k)x(2*k)} matrix which is indexed
    by the parameters (a,b) for group 1, then (a,b) for group 2, etc.

    If model = "quadratic", the information matrix is a square
    \eqn{(3 k)\times (3 k)}{(3*k)x(3*k)} matrix which is indexed by the 
    parameter (a,b,c)
    for group 1, then (a,b,c) for group 2, etc.
}
\references{
    Cox, D.R. and Hinkley, D.V. (1974).
    \emph{Theoretical Statistics}
    Chapman and Hall, London.
}
\seealso{
    \code{\link{info.binomial.design}}, 
    \code{\link{info.ordinal.design}}, 
    \code{\link{info.expsurv.design}}
}
\examples{
# Find the information matrix for a 2 group
# logistic Poisson design with a quadratic
# combination of covariate x and different
# sample sizes at each point
abc <- rbind(c(1.2,.9,.3), c(0.33,.21,.05))
covar <- c(1, 2, 3, 4, 5)
sample.size <- rbind(c(10,11,12,10,9), c(8,7,10,8,9))
info.poiss <- info.poisson.design(model="quadratic",
                                theta = abc, xpoints = covar,
                                natx=sample.size)
print(info.poiss)
}
\keyword{htest}
\concept{information}
% Converted by Sd2Rd version 1.21.   



