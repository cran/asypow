\name{info.reparam}
\alias{info.reparam}
\title{
    Reparameterize Expected Information Matrix
}
\description{
    Calculates the expected information matrix after reparameterization
    of a model using the method of propagation of error.
}
\usage{
    info.reparam(theta, info.mat, dg)
}
\arguments{
\item{theta}{
    Matrix of parameters of the linear part of the model.
    Each row represents a group. This is under the original
    parameterization.
}
\item{info.mat}{
    The information matrix under the original parameterization.
}
\item{dg}{
     A function that computes the partial derivatives of g, the
     transformation function. Let g.i be the function
     which transforms the vector of old parameters, theta,
     into the i'th element of the new parameters. The function dg should take
     theta and return a matrix whose [i,j] element
     is the derivative of g.i with respect to theta[j]
}}
\value{
     Returns the expected information matrix under the new parameterization.
}
\references{
    Bishop, Y.M., Fienberg, S.E., and Holland, P.W. (1975)
    \emph{Discrete Multivariate analysis: Theory and Practice}
    MIT Press, Cambridge, Mass.
\cr
   Cox, D.R. and Hinkley, D.V. (1974).
   \emph{Theoretical Statistics}
   Chapman and Hall, London.
\cr
   Tong, Y.L. (1990).
   \emph{The Multivariate Normal Distribution}
   Springer-Verlag, New York.
}
\examples{
# A logistic model posits that the probability of response
# is a logtistic function of a + b*x.
# Consider the value of x that produces 50\%
# response, x = -a/b. Since -a/b is not one of the parameters
# of the model, we must reparameterize to
# roe[1] = -a/b
# roe[2] = b
dg <- function(theta) {
# theta is a vector of length 2 containing c(a,b)
# dg <- [d{roe[1]}/d{a} d{roe[1]}/d{b}
#        d{roe[2]}/d{a} d{roe[2]}/d{b}]
  a <- theta[1]
  b <- theta[2]
  return(matrix(c(-1/b,a/b^2,0,1), nrow=2, ncol=2, byrow=TRUE))
}
# Let a = -0.9 and b = .7
theta <- c(-.9, .7)
# assign a set of covariate values
covar <- c(0.3, .9, 1.3, 2.5)
# Use info.binomial.design to calculate the information
# matrix under the original parameterization
info.orig <- info.binomial.design(model="linear", link="logistic", 
                                  theta=theta, xpoints=covar)
# Get the information matrix of the reparameterized model
info.new <- info.reparam(theta, info.orig, dg)
print(info.new)
}
\keyword{htest}
\concept{information}
% Converted by Sd2Rd version 1.21.
