## Basic Functions =============================================================

#-------------------------------------------------------------------------------
#' Generate a TenXSubset object
#'
#' @param cellIndex a numeric vector giving the cells (with reference to the
#'        original data set) that should be included in this subset
#' @param geneIndex a numeric vector giving the genes that should be included
#'        in this subset
#' @param groupSize the number of cells which should be included in each summary
#'        bin
#' @param path a character string which specifies the path to the .h5 TenX
#'        object which was previously downloaded
#'
#' @return A \code{TenXSubset} object. See \code{help(TenXSubset-class)} for more
#'         details.
#'
#' @export
#'
setGeneric("generateSubset", function(cellIndex, geneIndex, groupSize, path){
  standardGeneric("generateSubset")})

#-------------------------------------------------------------------------------
#' Generate a summary counts object
#'
#' @param object A \code{TenXSubset} object with groupSize = 1.
#'
#' @return A data.frame giving the cell, library, mouse, and gene counts
#'         associated with each gene which can then be used in the
#'         \code{plotTenXMouseExpr} and ... functions.
#'
#' @export
#'

setGeneric("generateSummaryExpr", function(TenXSubset){
  standardGeneric("generateSummaryExpr")})
