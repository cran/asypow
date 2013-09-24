\name{info.expsurv.design}
\alias{info.expsurv.design}
\title{
    Expected Information Matrix for a Clinical Trial with Exponential 
    Survival Design
}
\description{
    Calculates expected information matrix for a clinical trial with 
    exponential survival.


   The clinical trial will accrue subjects over a time period \eqn{L}{L}.
   Each subject will enter the study at a random time between 0 
   and \eqn{L}{L}, so the subject's follow up time, \eqn{U}{U}, will be uniformly
   distributed between 0 and \eqn{L}{L}. A subject with follow up
   time \eqn{U}{U}, can die at a time \eqn{t}{t} between 0 and \eqn{U}{U}, 
   or the subject can
   be withdrawn alive at time \eqn{U}{U}. The density of time to death
   is exponential distribution with hazard, \eqn{w}{w}.


   The parameter \eqn{w}{w} depends on a covariate, \eqn{x}{x}, 
   via the exponentiation
   of a linear or quadratic function of \eqn{x}{x}, 
   \eqn{w= \exp(a+b x)}{w = exp(a + b*x)}
   or \eqn{w= \exp(a+b x + c x^2)}{w = exp(a + b*x + c*x^2)}.


   This model is both the proportional hazards model and the accelerated
   failure model for exponential survival.
}
\usage{
   info.expsurv.design(model="linear", theta, L, xpoints,
                    natx=1, group.size=1)
}
\arguments{
\item{theta}{
    Matrix of parameters for the linear combination of the covariate
    x. Each row represents a group so theta[i,] = c(a,b)
    if model = "linear" or theta[i,] = c(a,b,c) if model = "quadratic".
}
\item{L}{
    The length of the clinical trial. If all groups have the same
    trial length, L should be a single number; otherwise, L should
    be a vector the same length as the number of rows in w 
    where L[i] is the length of the clinical trial for the i'th group.
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
    Linear indicates, \eqn{u = a + b x}{u = a + b*x}, and
    quadratic indicates, 
    \eqn{u = a+ b x + c x^2}{u = a + b*x + c*x^2}.
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
   \eqn{(3 k)\times (3 k)}{(3*k)x(3*k)} matrix which is 
   indexed by the parameter (a,b,c)
   for group 1, then (a,b,c) for group 2, etc.
}
\references{
   Cox, D.R. and Hinkley, D.V. (1974).
   \emph{Theoretical Statistics}
   Chapman and Hall, London.
}
\seealso{
   \code{\link{info.binomial.design}}, 
   \code{\link{info.poisson.design}}, 
   \code{\link{info.ordinal.design}}
}
\examples{
# Find the information matrix for a clinical trial
# with hazard w(x) = -0.848 + 0.7*x which lasts
# three years and has 10 x values equally spaced
# between -3 and 3 with equal sample sizes.
ab <- c(-.848, .7)
covar <- seq(-3, 3, length=10)
LL <- 3
info.expsurv <- info.expsurv.design(theta = ab, L = LL, xpoints = covar)
print(info.expsurv)
}
\keyword{htest}
\concept{information}
% Converted by Sd2Rd version 1.21. 

