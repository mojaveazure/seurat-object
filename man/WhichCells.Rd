% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generics.R, R/assay.R
\name{WhichCells}
\alias{WhichCells}
\alias{WhichCells.Assay}
\title{Identify cells matching certain criteria}
\usage{
WhichCells(object, ...)

\method{WhichCells}{Assay}(object, cells = NULL, expression, invert = FALSE, ...)
}
\arguments{
\item{object}{An object}

\item{...}{Arguments passed to other methods}

\item{cells}{Subset of cell names}

\item{expression}{A predicate expression for feature/variable expression, can
evalue anything that can be pulled by \code{FetchData}; please note, you may
need to wrap feature names in backticks (\code{``}) if dashes between numbers
are present in the feature name}

\item{invert}{Invert the selection of cells}
}
\value{
A vector of cell names
}
\description{
Returns a list of cells that match a particular set of criteria such as
identity class, high/low values for particular PCs, ect..
}
\examples{
WhichCells(object = pbmc_small, idents = 2)
WhichCells(object = pbmc_small, expression = MS4A1 > 3)
levels(x = pbmc_small)
WhichCells(object = pbmc_small, idents = c(1, 2), invert = TRUE)

}
\seealso{
\code{\link{FetchData}}
}