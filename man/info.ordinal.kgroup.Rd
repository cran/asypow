\name{info.ordinal.kgroup}
\alias{info.ordinal.kgroup}
\title{
    Expected Information Matrix for Single or 
    Multiple Group Ordinal Observations
}
\description{
    Calculates expected information matrix for a single observation for 
    ordered outcomes in a single or multiple groups.  


    The natural null hypothesis for a single group is that the probabilities of 
    the outcomes is some specified set of values.  For multiple groups, the
    natural null hypothesis is that the probabilities are the same.
}
\usage{
    info.ordinal.kgroup(p, group.size=1)
}
\arguments{
\item{p}{
    If there are \eqn{n}{n} ordered outcome categories and \eqn{k}{k} 
    groups then \eqn{p}{p} will have
    dimension \eqn{k \times (n-1)}{k X (n-1)}.  
    If the number of groups is one, then \eqn{p}{p} can be
    a vector of length (n-1).

    Within a single group, \eqn{p_i}{p[i]} is the probability that the outcome of a
    trial is some category \eqn{j}{j} with \eqn{j \le i}{j <= i}.  
    Consequently, the \eqn{p_i}{p[i]} must be
    monotonely increasing with \eqn{k}{k}.  
    If there are \eqn{n}{n} categories, of necessity
    \eqn{p_n=1}{p[n] == 1}, so this redundant value is not included.

    Within a single group, the probability that the outcome is
    category 1 is \eqn{p_1}{p[1]}.  
    For \eqn{2 \le i \le n}{2 <= i < n} the probability that the outcome is
    category \eqn{k}{k} is 
    \eqn{p_i - p_{i-1}}{p[i] - p[i-1]}.  
    The probability of outcome \eqn{n}{n} is 
    \eqn{1 - p_{n-1}}{1 - p[n-1]}.
}
\item{group.size}{
    Needed only if there are to be several groups with unequal sample
    sizes.  The value of the i'th component is the relative sample size of
    the i'th group.  The calculation made is for a single observation
    spread over the several groups in proportion to the specified sample
    size.  If this value is specified, it should be a vector whose
    length is the row dimension of  p.  
}}
\value{
    Expected information matrix for a single observation.  The matrix is
    dimensioned 
    \eqn{(k(n-1))\times (k(n-1))}%
        {( k*(n-1) ) X ( k*(n-1) )}.
}
\references{
    Cox, D.R. and Hinkley, D.V. (1974).
    \emph{Theoretical Statistics}
    Chapman and Hall, London.
}
\seealso{
    \code{\link{info.binomial.kgroup}}, 
    \code{\link{info.poisson.kgroup}}, 
    \code{\link{info.expsurv.kgroup}}
}
\examples{
# Find the information matrix for a 2 group ordinal
# model with 4 categories.
p1 <- c(.1, .2, .3)  # Probabilities for group 1
p2 <- c(.2, .5, .7)  # Probabilities for group 2
p <- rbind(p1,p2)
ngrps <- c(.4, .6)  # Percentage of data in each group
info.ord <- info.ordinal.kgroup(p, ngrps)
print(info.ord)
}
\keyword{htest}
\concept{information}
% Converted by Sd2Rd version 1.21.



