\name{info.mvlogistic}
\alias{info.mvlogistic}
\title{
    Expected Information Matrix for a Multivariate Logistic Model
}
\description{
   Calculates the expected information matrix for a multivariate
   logistic model where the parameter \eqn{p}{p}, probability of an event,
   depends on the covariates, 
   \eqn{x = c(x[1], x[2], \ldots, x[n]}{x = c(x[1], x[2], \dots, x[n])}, 
   through a logistic, 
   \eqn{p = \exp(u) / (1 + \exp(u))}{p = exp(u)/(1+exp(u))}, model. 
   The variable \eqn{u}{u} is a linear combination of the covariates via a set of
   coefficients, 
   \eqn{\mbox{coef} = c(\mbox{coef}[1],\ldots, \mbox{coef}[n]) }{coef = c(coef[1], coef[2], \dots, coef[n])},
   \eqn{u = \sum_{i=1}^n \mbox{coef}[i] x[i]}{u = Sum (coef[i] * x[i]) i = 1, \dots ,n}.


   The usual use of this routine is for tabulated data in which case the
   x's will all be 0 or 1 valued indicator variables.
}
\usage{
    info.mvlogistic(coef, design, rss=1)
}
\arguments{
\item{coef}{
    Vector of length p (number of covariates) giving coefficients
    of variables.
}
\item{design}{
    Matrix of dimension \eqn{n \times p}{(n X p)} 
    each row of which gives values of
    covariates at one of the n design points.


    Note: Most models will include a constant term and the column of
    design corresponding to this term will be identically 1.
}
\item{rss}{
    The relative sample size at each design point. The default
    is the same sample size at each design point. If changed from
    the default, rss should be a vector of length n.
}}
\value{
    The information matrix for one observation for this design.
}
\references{
    Cox, D.R. and Hinkley, D.V. (1974).
    \emph{Theoretical Statistics}
    Chapman and Hall, London.
}
\seealso{
    \code{\link{info.mvloglin}}
}
\examples{
# Find the information matrix for a multivariate
# logistic design with variables x, y and z
#    Define coefficient matrix so that 
#    u = 1 + .5*x + .7*y + .9*z
coef <- c(1, .5, .7, .9)
#    Define the design matrix so that there are 10 design points
intercept <- rep(1, 10)
x <- rnorm(10)
y <- rnorm(10)
z <- rnorm(10)
design <- cbind(intercept, x, y, z)
#    Use info.mvlogistic to find the information matrix for
#    this design
info.xyz <- info.mvlogistic(coef, design)
print(info.xyz)
}
\keyword{htest}
\concept{information}
% Converted by Sd2Rd version 1.21.   



