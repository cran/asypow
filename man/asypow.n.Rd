\name{asypow.n}
\alias{asypow.n}
\title{
        Asymptotic Sample Size
}
\description{
        Calculates the sample size required to obtain the desired power for a test
        via likelihood ratio methods.
}
\usage{
       asypow.n(asypow.obj, power, significance)
}
\arguments{
       \item{asypow.obj}{
               The object returned from asypow.noncent.
}
       \item{power}{
               The desired power of the test.
}
       \item{significance}{
               The desired significance level of the test.
}}
\value{
     Returns the  sample size needed to achieve specified power at the
     specified significance level.
}
\references{
     Cox, D.R. and Hinkley, D.V. (1974).
     \emph{Theoretical Statistics}
     Chapman and Hall, London.
}
\seealso{
      \code{\link{asypow.noncent}}, 
      \code{\link{asypow.sig}}, 
      \code{\link{asypow.power}}
}
\examples{
# Three Sample Poisson Example :
#    Three independent Poisson processes produce events at
#    mean rates of 1, 2 and 3 per day. For how many days
#    must the processes be observed to have an 80\% chance
#    of detecting that the means are different at an
#    overall significance level of 0.05?
# Step 1 : Find the information matrix
pois.mean <- c(1,2,3)
info.pois <- info.poisson.kgroup(pois.mean, group.size=3)
# Step 2: Create the constraints matrix
constraints <- matrix(c(2,1,2,2,2,3),ncol=3,byrow=TRUE)
# Step 3: Find the noncentrality parameter and
#         degrees of freedom for the test
poisson.object <- asypow.noncent(pois.mean, info.pois, constraints)
# Step 4: Compute sample size needed for 
#         0.8 power with significance level 0.05
n.pois <- asypow.n(poisson.object, 0.8, 0.05)
# Step 5: Divide the sample size by 3 (the number of processes)
#         to get the number of days required.
n.days <- n.pois/3
print(n.days)
}
\concept{sample}
\keyword{htest}
% Converted by Sd2Rd version 1.21.
