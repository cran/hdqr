% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nc.hdqr-methods.R
\name{coef.nc.hdqr}
\alias{coef.nc.hdqr}
\title{Extract Model Coefficients from a `nc.hdqr` Object}
\usage{
\method{coef}{nc.hdqr}(object, s = NULL, type = c("coefficients", "nonzero"), ...)
}
\arguments{
\item{object}{Fitted `nc.hdqr()` object.}

\item{s}{Values of the penalty parameter `lambda` for which coefficients are requested.
Defaults to the entire sequence used during the model fit.}

\item{type}{Type of prediction required. Type `"coefficients"` computes the coefficients at the requested 
values for `s`. Type `"nonzero"` returns a list of the indices of the nonzero coefficients for each 
value of \code{s}.}

\item{...}{Not used.}
}
\value{
Returns a matrix or vector of coefficients corresponding to the specified `lambda` values.
}
\description{
Retrieves the coefficients at specified values of `lambda` from a fitted `nc.hdqr()` model.
}
\details{
This function extracts coefficients for specified `lambda` values from a `nc.hdqr()` object.
If `s`, the vector of `lambda` values, contains values not originally used in the model fitting,
the `coef` function employs linear interpolation between the closest `lambda` values from the 
original sequence to estimate coefficients at the new `lambda` values.
}
\examples{
set.seed(315)
n <- 100
p <- 400
x <- matrix(data = rnorm(n * p, mean = 0, sd = 1), nrow = n, ncol = p)
beta_star <- c(c(2, 1.5, 0.8, 1, 1.75, 0.75, 0.3), rep(0, (p - 7)))
eps <- rnorm(n, mean = 0, sd = 1)
y <- x \%*\% beta_star + eps
tau <- 0.5
lam2 <- 0.01
lambda <- 10^(seq(1,-4, length.out=30))
nc.fit <- nc.hdqr(x=x, y=y, tau=tau, lambda=lambda, lam2=lam2, pen="scad")
nc.coefs <- coef(nc.fit, s = nc.fit$lambda[3:5])
}
\seealso{
\code{\link{nc.hdqr}}, \code{\link{predict.nc.hdqr}}
}
