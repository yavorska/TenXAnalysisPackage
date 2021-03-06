% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenericsIndexing.R
\name{determineSampleFromGroup}
\alias{determineSampleFromGroup}
\title{Get indices of cells in a group}
\usage{
determineSampleFromGroup(queryGroupIndexVector, TenXSubset)
}
\arguments{
\item{queryGroupIndexVector}{A numeric vector giving the group indices we
would like to retrieve cell/sample indices from.}

\item{TenXSubset}{A \code{TenXSubset} object.}
}
\value{
An index vector identifying the cells in this group(s).
}
\description{
Given a group index, determine the samples contained in that group. This can
be very useful when a group seems to be an outlier and we can not only see
which cells belong to that group but also remove them from the subset
together with the group quite easily.
}
