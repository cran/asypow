\name{info.ordinal.design}
\alias{info.ordinal.design}
\title{
    Expected Information Matrix for an Ordinal Design
}
\description{
    Calculates the expected information matrix for an ordinal
    design where the parameters \eqn{p_j}{p[j]}, 
    probability of an event
    in category \eqn{j}{j} or less, depend on a covariate, 
    \eqn{x}{x}, through a logistic,
    \eqn{p_j = \exp( u_j) / (1+ \exp(u_j)}{p[j] = exp(u[j])/(1+exp(u[j]))}, 
    or complementary log,
    \eqn{p_j = 1 - \exp( - \exp( u_j))}{p[j] = 1 - exp(-exp(u[j]))}, 
    model. The variable \eqn{u_j}{u[j]} is a
    linear, 
    \eqn{u_j = a_j + b x}{u[j] = a[j] + b*x}, or quadratic, 
    \eqn{u_j = a_j + b x + c x^2}{u[j] = a[j] + b*x + c*x^2}, 
    function of the covariate \eqn{x}{x}.
}
\usage{
    info.ordinal.design(model="linear", link="logistic", theta,
                     xpoints, natx=1, group.size=1)
}
\arguments{
\item{theta}{
    Matrix of parameters for the linear combination of the covariate
    x. Each row represents a group so if model = "linear"


    \deqn{\theta[i,] = c( a[1], a[2], a[3], \ldots, a[r-1], b)}{theta[i,] = c(a[1],a[2],a[3],\dots,a[r-1],b)}


    where \eqn{r}{r} is the number of categories. If model = "quadratic" 


     \deqn{\theta[i,] = c(a[1], a[2], \ldots, a[r-1],b,c)}%
          {theta[i,] = c(a[1],a[2],a[3],\dots,a[r-1],b,c)}
}
\item{xpoints}{
    Matrix of covariate values for each group. If there is only
    1 group or all groups have the same covariate value, xpoints
    should be a vector; otherwise, the number of rows in xpoints
    must equal the number of rows in theta.
}
\item{model}{
    One of \{"linear", "quadratic"\}. Specifies the function
    of the covariate x that will be used.
    Linear indicates, 
    \eqn{u_j = a_j + b x}{u[j] = a[j] + b*x}, and
    quadratic indicates, 
    \eqn{u_j = a_j + b x + c x^2, \quad  j=1, \ldots, r-1}{u[j] = a[j] + b*x + c*x^2 j = 1,\dots,r-1}.
    Only enough to ensure a unique match need be supplied.
}
\item{link}{
    One of \{"logistic", "complementary log"\}. Specifies the link
    between the linear or quadratic combination of the covariate \eqn{x}{x}
    and the parameters of the ordinal model, 
    \eqn{p_j}{p[j]}. Logistic indicates
    \eqn{p_j = \exp(u_j) / (1 + \exp(u_j))}{p[j] = exp(u[j])/(1+exp(u[j]))}, 
    and complementary log indicates,
    \eqn{p_j = 1 - \exp( -\exp(u_j)), \quad j=1, \ldots, r-1}{p[j] = 1 - exp(-exp(u[j])) j = 1,\dots,r-1}.
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
    length is the same as the number of rows in theta.
}}
\value{
    The information matrix for one observation for this design.

    If model = "linear" and there are \eqn{r}{r} categories and \eqn{k}{k} groups,
    the information matrix is a square \eqn{(r k)\times (r k)}{(r*k)x(r*k)} 
    matrix which is indexed by the parameters 
    \eqn{a[1], a[2], \ldots, a[r-1], b}{(a[1], a[2], \dots, a[r-1], b)}
    for group 1, then 
    \eqn{(a[1], a[2], \ldots, a[r-1], b)}{(a[1], a[2], \dots, a[r-1], b)} for group 2, etc.

    If model = "quadratic", the information matrix is a square
    \eqn{((r+1)k)\times ((r+1)k)}{((r+1)*k)x((r+1)*k)} 
     matrix which is indexed by the parameters
    \eqn{(a[1], a[2], \ldots, a[r-1], b,c)}{(a[1], a[2], \dots, a[r-1], b, c)} for group 1, 
    then 
    \eqn{(a[1], a[2], \ldots, a[r-1], b, c)}{(a[1], a[2], \dots, a[r-1], b, c)} for group 2, etc.
}
\references{
    Cox, D.R. and Hinkley, D.V. (1974).
    \emph{Theoretical Statistics}
    Chapman and Hall, London.
}
\seealso{
      \code{\link{info.binomial.design}}, 
      \code{\link{info.poisson.design}}, 
      \code{\link{info.expsurv.design}}
}
\examples{
# Find the information matrix for an ordinal design
# with one group and equal sample sizes.
# Assume 4 categories and use a logistic
# line and quadratic model. Let
# u[1] = 1 + 2.5*x
# u[2] = 2 + 2.5*x
# u[3] = 3 + 2.5*x
# Use values x = -3,0,3
theta <- c(1, 2, 3, 2.5)
covar <- c(-3, 0, 3)
info.ord <- info.ordinal.design(theta = theta, xpoints = covar)
print(info.ord)
}
\keyword{htest}
\concept{information}
% Converted by Sd2Rd version 1.21.    



