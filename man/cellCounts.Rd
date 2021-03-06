% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenericsAccessors.R
\name{cellCounts}
\alias{cellCounts}
\title{Return cellCounts data.frame}
\usage{
cellCounts(TenXSubset)
}
\arguments{
\item{TenXSubset}{A TenXSubset object}
}
\value{
\code{cellCounts} data frame.
}
\description{
A quick method to access the cellCounts \code{data.frame} within a
TenXSubset object.
}
\details{
The \code{data.frame} contains:
\itemize{
    \item The total number of transcripts associated with each cell,
    "transcripts"
    \item The total number of genes expressed in each cell, "nGenesExpr"
}
Note that these can be accessed separately using the \code{cellCountsTrans}
and \code{cellCountsExpr} functions.
}
