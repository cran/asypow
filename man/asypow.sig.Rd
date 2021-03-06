\name{asypow.sig}
\alias{asypow.sig}
\title{
   Asymptotic Significance
}
\description{
   Calculates the significance level of a test via likelihood ratio methods.
}
\usage{
     asypow.sig(asypow.obj, sample.size, power)
}
\arguments{
\item{asypow.obj}{
   The object returned from asypow.noncent.
}
\item{sample.size}{
   The sample size of the test.
}
\item{power}{
   The power of the test.
}}
\value{
   Returns the significance level of the test.
}
\references{
   Cox, D.R. and Hinkley, D.V. (1974).
   \emph{Theoretical Statistics}
   Chapman and Hall, London.
}
\seealso{
   \code{\link{asypow.noncent}}, 
   \code{\link{asypow.n}}, 
   \code{\link{asypow.power}}
}
\examples{
# Single Group Binomial Example:
#    Consider testing the null hypothesis that the binomial
#    probability is p = .2 when the actual probability is .4.
#    What significance level corresponding to a sample
#    size of 47 and power of .8?
# Step 1: Find the information matrix
info.binom <- info.binomial.kgroup(.4)
# Step 2: Create the constraints matrix
constraints <- c(1, 1, .2)
# Step 3: Find the noncentrality parameter and
#         degrees of freedom for the test
binom.object <- asypow.noncent(.4, info.binom, constraints)
# Step 4: Compute the power of a test with
#         sample size of 47 and a significance level 0.05
sig.binom <- asypow.sig(binom.object, 47, 0.8)
print(sig.binom)
}
\keyword{htest}
\concept{signficance}
% Converted by Sd2Rd version 1.21. 



