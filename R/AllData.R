#' rowData of the original data set
#'
#' A data.frame containing the gene names (HGNC) and ENSEMBL id's of each gene
#' included in the original data set.
#'
#' @name TenXse_rowData
#'
NULL

#' colData of the original data set
#'
#' A \code{data.frame} containing:
#' \itemize{
#'     \item The \code{Barcode} associated with each cell (a combination of a
#'     sequence and the library number)
#'     \item The \code{Sequence} identifying this particular cell.
#'     \item The \code{Library} that this cell belongs to.
#'     \item The \code{Mouse} that this cell belongs to (either A or B)
#' }
#'
#' @name TenXse_colData
#'
NULL

#' GO annotation data file
#'
#' @name EG2GO
#'
NULL

#' Summary file for entire data set
#'
#' A \code{TenXSubset} object created from the original data set with groupSize
#' 10000.
#'
#' @name TenXSubsetAll
#'
NULL
