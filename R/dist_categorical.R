#' The Categorical distribution
#'
#' \lifecycle{stable}
#'
#' Categorical distributions are used to represent events with multiple
#' outcomes, such as what number appears on the roll of a dice. This is also
#' referred to as the 'generalised Bernoulli' or 'multinoulli' distribution.
#' The Cateogorical distribution is a special case of the [Multinomial()]
#' distribution with `n = 1`.
#'
#' @param prob A list of probabilities of observing each outcome category.
#'
#' @details
#'
#'   We recommend reading this documentation on
#'   <https://pkg.mitchelloharawild.com/distributional/>, where the math
#'   will render nicely.
#'
#'   In the following, let \eqn{X} be a Categorical random variable with
#'   probability parameters `p` = \eqn{\{p_1, p_2, \ldots, p_k\}}.
#'
#'   The Categorical probability distribution is widely used to model the
#'   occurance of multiple events. A simple example is the roll of a dice, where
#'   \eqn{p = \{1/6, 1/6, 1/6, 1/6, 1/6, 1/6\}} giving equal chance of observing
#'   each number on a 6 sided dice.
#'
#'   **Support**: \eqn{\{1, \ldots, k\}}{{1, ..., k}}
#'
#'   **Mean**: \eqn{p}
#'
#'   **Variance**: \eqn{p \cdot (1 - p) = p \cdot q}{p (1 - p)}
#'
#'   **Probability mass function (p.m.f)**:
#'
#'   \deqn{
#'     P(X = i) = p_i
#'   }{
#'     P(X = i) = p_i
#'   }
#'
#'   **Cumulative distribution function (c.d.f)**:
#'
#'   The cdf() of a categorical distribution is undefined as the outcome categories aren't ordered.
#'
#' @examples
#' dist <- dist_categorical(prob = list(c(0.05, 0.5, 0.15, 0.2, 0.1), c(0.3, 0.1, 0.6)))
#'
#' dist
#'
#' generate(dist, 10)
#'
#' density(dist, 2)
#' density(dist, 2, log = TRUE)
#'
#' # The outcomes aren't ordered, so many statistics are not applicable.
#' cdf(dist, 4)
#' quantile(dist, 0.7)
#' mean(dist)
#' variance(dist)
#' skewness(dist)
#' kurtosis(dist)
#'
#' @export
dist_categorical <- function(prob){
  prob <- lapply(prob, function(x) x/sum(x))
  prob <- as_list_of(prob, .ptype = double())
  new_dist(p = prob, class = "dist_categorical")
}

#' @export
print.dist_categorical <- function(x, ...){
  cat(format(x, ...))
}

#' @export
format.dist_categorical <- function(x, digits = 2, ...){
  sprintf(
    "Categorical[%s]",
    format(length(x[["p"]]), digits = digits, ...)
  )
}

#' @export
density.dist_categorical <- function(x, at, ...){
  x[["p"]][match(at, seq_along(x[["p"]]))]
}

#' @export
quantile.dist_categorical <- function(x, p, ...){
  NA_real_
}

#' @export
cdf.dist_categorical <- function(x, q, ...){
  NA_real_
}

#' @export
generate.dist_categorical <- function(x, times, ...){
  sample(x = seq_along(x[["p"]]), size = times, prob = x[["p"]], replace = TRUE)
}

#' @export
mean.dist_categorical <- function(x, ...){
  NA_real_
}

#' @export
variance.dist_categorical <- function(x, ...){
  NA_real_
}

#' @export
skewness.dist_categorical <- function(x, ...) {
  NA_real_
}

#' @export
kurtosis.dist_categorical <- function(x, ...) {
  NA_real_
}
