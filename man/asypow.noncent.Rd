\name{asypow.noncent}
\alias{asypow.noncent}
\title{
    Asymptotic Noncentrality Parameter
}
\description{
    Given an information matrix, alternative hypothesis parameter values, and
    constraints that create the null hypothesis from the alternative,
    calculates noncentrality parameter, degrees of freedom and parameter
    value estimates under the null hypothesis.
}
\usage{
    asypow.noncent(theta.ha, info.mat, constraints, 
               nobs.ell=1, get.ho=TRUE)
}
\arguments{
\item{theta.ha}{
   Array of parameter values under the alternative hypothesis.
}
\item{info.mat}{
   The information matrix, the second derivate matrix of the
   expected log likelihood under the alternative hypothesis.
   The negative of the hessian matrix.
}
\item{constraints}{
   The constraints which set the null hypothesis from the
   alternative hypothesis. They are in matrix form.
    CONSTRAINT[,1] is 1 for setting parameter to a value
                   2 for equality of two parameters
    CONSTRAINT[,2] is case on CONSTRAINT[,1]
               (1) Index of parameter to set to value
               (2) Index of one of two parameters to 
                   be set equal
    CONSTRAINT[,3] is case on CONSTRAINT[,1]
               (1) Value to which parameter is set
               (2) Index of other of two parameters
                   to be set equal
}
\item{nobs.ell}{
   The number of observations used in computing the information
   matrix.  That is, info.mat is that for nobs.ell observations.
   Default is 1, which is the correct value for all of the 'info.'
   routines supplied here.
}
\item{get.ho}{
   If TRUE, estimates of the parameter values under the null
   hypothesis are calculated and returned, otherwise not.
   Default is TRUE.
}}%end \arguments
\value{
   Returns a list including
\item{w}{
     The noncentrality parameter for 1 observation.
}
\item{df}{
     The degrees of freedom of the test
}
\item{theta.ho}{
     Estimates of the parameter values under the null hypothesis.
}}
\references{
    Cox, D.R. and Hinkley, D.V. (1974).
    \emph{Theoretical Statistics}
    Chapman and Hall, London.
}
\seealso{
    \code{\link{asypow.n}}, 
    \code{\link{asypow.sig}}, 
    \code{\link{asypow.power}}
}
\examples{
# Three Sample Poisson Example :
#    Three independent Poisson processes produce events at
#    mean rates of 1, 2 and 3 per day. 
# Find the information matrix
pois.mean <- c(1,2,3)
info.pois <- info.poisson.kgroup(pois.mean,group.size=3)
# Create the constraints matrix
constraints <- matrix(c(2,1,2,2,2,3),ncol=3,byrow=TRUE)
# Calculate noncentrality parameter, degrees of freedom and parameter
# value estimates under the null hypothesis for the test.
poisson.object <- asypow.noncent(pois.mean,info.pois,constraints)
}
\keyword{htest}
\concept{noncentrality}
% Converted by Sd2Rd version 1.21.

