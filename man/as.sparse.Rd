% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{as.sparse}
\alias{as.sparse}
\alias{as.sparse.data.frame}
\alias{as.sparse.Matrix}
\alias{as.sparse.matrix}
\title{Cast to Sparse}
\usage{
as.sparse(x, ...)

\method{as.sparse}{data.frame}(x, ...)

\method{as.sparse}{Matrix}(x, ...)

\method{as.sparse}{matrix}(x, ...)
}
\arguments{
\item{x}{An object}

\item{...}{Arguments passed to other methods}
}
\value{
A sparse representation of the input data
}
\description{
Convert dense objects to sparse representations
}
\concept{utils}
