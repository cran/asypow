\name{asypow.power}
\alias{asypow.power}
\concept{Power calculations}
\title{
   Asymptotic Power
}
\description{
   Calculates the power of a test via likelihood ratio methods.
}
\usage{
     asypow.power(asypow.obj, sample.size, significance)
}
\arguments{
\item{asypow.obj}{
   The object returned from asypow.noncent.
}
\item{sample.size}{
   The sample size of the study.
}
\item{significance}{
   The significance level of the test.
}}
\value{
   Returns the power of the test.
}
\references{
   Cox, D.R. and Hinkley, D.V. (1974).
   \emph{Theoretical Statistics}
   Chapman and Hall, London.
}
\seealso{
   \code{\link{asypow.noncent}}, 
   \code{\link{asypow.n}}, 
   \code{\link{asypow.sig}}
}
\examples{
# Single Group Binomial Example:
#    Consider testing the null hypothesis that the binomial
#    probability is p = .2 with a sample size of 47 and
#    signficance level of 0.05. What is the power of the
#    test if p is actually .4?
# Step 1: Find the information matrix
info.binom <- info.binomial.kgroup(.4)
# Step 2: Create the constraints matrix
constraints <- c(1, 1, .2)
# Step 3: Find the noncentrality parameter and
#         degrees of freedom for the test
binom.object <- asypow.noncent(.4, info.binom, constraints)
# Step 4: Compute the power of a test with
#         sample size of 47 and a significance level 0.05
power.binom <- asypow.power(binom.object, 47, 0.05)
print(power.binom)
}
\keyword{htest}
\concept{power}
% Converted by Sd2Rd version 1.21.

