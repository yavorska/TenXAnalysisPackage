## Accessor methods for each slot ==============================================
## Create accessor methods for each slot simply called the slot name

#-------------------------------------------------------------------------------
#' Return geneCounts data.frame
#'
#' A quick method to access the geneCounts \code{data.frame} within a TenXSubset
#' object.
#'
#' The \code{data.frame} contains the transcript counts associated with each
#' gene for each group in the data set. If this method is used (rather than
#' simply viewing the contents of the \code{geneCounts} slot), the gene names
#' will automatically be included as row names.
#'
#' @param TenXSubset A TenXSubset object
#'
#' @return \code{geneCounts} data frame.
#'
#' @export geneCounts
#'
setGeneric("geneCounts",
           function(TenXSubset){standardGeneric ("geneCounts")})
#-------------------------------------------------------------------------------
#' Return geneExpressed data.frame
#'
#' A quick method to access the geneExpressed \code{data.frame} within a
#' TenXSubset object.
#'
#' The \code{data.frame} contains the proportion of times each gene is expressed
#' in each group of cells. If this method is used (rather than simply viewing
#' the contents of the \code{geneExpressed} slot), the gene names will
#' automatically be included as row names.
#'
#' @param TenXSubset A TenXSubset object
#'
#' @return \code{geneExpressed} data frame.
#'
#' @export geneExpressed
#'
setGeneric("geneExpressed",
           function(TenXSubset){standardGeneric ("geneExpressed")})
#-------------------------------------------------------------------------------
#' Return the HGNC names of the genes
#'
#' A quick method to access which genes are included in this TenXSubset.
#'
#' @param TenXSubset A TenXSubset.
#'
#' @return A character vector of gene names.
#'
#' @export geneNames
#'
setGeneric("geneNames",
           function(TenXSubset){standardGeneric ("geneNames")})
#-------------------------------------------------------------------------------
#' Return the ENSEMBL names of the genes
#'
#' A quick method to access which ENSEMBL ids are included in this TenXSubset.
#'
#' @param TenXSubset A TenXSubset.
#'
#' @return A character vector of ENSEMBL gene ids.
#'
#' @export geneENSEMBL
#'
setGeneric("geneENSEMBL",
           function(TenXSubset){standardGeneric ("geneENSEMBL")})
#-------------------------------------------------------------------------------
#' Return cellCounts data.frame
#'
#' A quick method to access the cellCounts \code{data.frame} within a
#' TenXSubset object.
#'
#' The \code{data.frame} contains:
#' \itemize{
#'     \item The total number of transcripts associated with each cell,
#'     "transcripts"
#'     \item The total number of genes expressed in each cell, "nGenesExpr"
#' }
#' Note that these can be accessed separately using the \code{cellCountsTrans}
#' and \code{cellCountsExpr} functions.
#'
#' @param TenXSubset A TenXSubset object
#'
#' @return \code{cellCounts} data frame.
#'
#' @export cellCounts
#'
setGeneric("cellCounts",
           function(TenXSubset){standardGeneric ("cellCounts")})
#-------------------------------------------------------------------------------
#' Return the total number of transcripts for each cell
#'
#' A quick method to access the \code{transcripts} column of the
#' \code{cellCounts} data frame.
#'
#' @param TenXSubset A TenXSubset object
#'
#' @return A numeric vector giving the transcript counts for each cell.
#'
#' @export cellCountsTrans
#'
setGeneric("cellCountsTrans",
           function(TenXSubset){standardGeneric ("cellCountsTrans")})
#-------------------------------------------------------------------------------
#' Return the total number of genes expressed for each cell
#'
#' A quick method to access the \code{expressed} column of the
#' \code{cellCounts} data frame.
#'
#' @param TenXSubset A TenXSubset object
#'
#' @return A numeric vector giving the total number of genes expressed for each
#' cell.
#'
#' @export cellCountsExpr
#'
setGeneric("cellCountsExpr",
           function(TenXSubset){standardGeneric ("cellCountsExpr")})
#-------------------------------------------------------------------------------
#' Return the mouseID vector
#'
#' A quick method to access the mouse (A or B) associated with each cell in the
#' data.
#'
#' @param TenXSubset A TenXSubset object
#'
#' @return A character vector of A's and B's characterising each cell by mouse.
#'
#' @export cellMouse
#'
setGeneric("cellMouse",
           function(TenXSubset){standardGeneric ("cellMouse")})
#-------------------------------------------------------------------------------
#' Return the libraryID vector
#'
#' A quick method to access the library that each cell belongs to.
#'
#' @param TenXSubset A TenXSubset object
#'
#' @return A numeric vector giving the ID of the library each cell belongs to.
#'
#' @export cellLib
#'
setGeneric("cellLib",
           function(TenXSubset){standardGeneric ("cellLib")})
#-------------------------------------------------------------------------------
#' Return the cellGroup vector
#'
#' A quick method to access the cellGroup that each cell belongs to.
#'
#' Since we bin the cells into small groups when we want to look at the data as
#' a whole (and one cannot do that due to memory restrictions unless summarised
#' data is used), this is useful for determining which group should be removed
#' if we find that a particular cell does not fit in with the rest.
#'
#' @param TenXSubset A TenXSubset object
#'
#' @return A numeric vector giving the ID of the group each cell belongs to.
#'
#' @export cellGroup
#'
setGeneric("cellGroup",
           function(TenXSubset){standardGeneric ("cellGroup")})
#-------------------------------------------------------------------------------
#' Total number of cells in the data set
#'
#' @param TenXSubset A TenXSubset object
#'
#' @export cellN
#'
setGeneric("cellN",
           function(TenXSubset){standardGeneric ("cellN")})
#-------------------------------------------------------------------------------
#' Total number of groups in the data set
#'
#' @param TenXSubset A TenXSubset object
#'
#' @export groupN
#'
setGeneric("groupN",
           function(TenXSubset){standardGeneric ("groupN")})
#-------------------------------------------------------------------------------
#' Total number of libraries in the data set
#'
#' @param TenXSubset A TenXSubset object
#'
#' @export libN
#'
setGeneric("libN",
           function(TenXSubset){standardGeneric ("libN")})
#-------------------------------------------------------------------------------
#' Total number of genes in the data set
#'
#' @param TenXSubset A TenXSubset object
#'
#' @export geneN
#'
setGeneric("geneN",
           function(TenXSubset){standardGeneric ("geneN")})
#-------------------------------------------------------------------------------
#' Cells in data
#'
#' Return cell indices of the cells included in this TenXSubset object
#' relative to the original, full 10x Genomics 1.3 Million cell data set.
#'
#' @param TenXSubset A TenXSubset object
#'
#' @return A numeric vector of indices.
#'
#' @export cellIndex
#'
setGeneric("cellIndex",
           function(TenXSubset){standardGeneric ("cellIndex")})
#-------------------------------------------------------------------------------
#' Genes in data
#'
#' Return gene indices of the cells included in this TenXSubset object
#' relative to the original, full 10x Genomics 1.3 Million cell data set.
#'
#' @param TenXSubset A TenXSubset object
#'
#' @return A numeric vector of indices.
#'
#' @export geneIndex
#'
setGeneric("geneIndex",
           function(TenXSubset){standardGeneric ("geneIndex")})
#-------------------------------------------------------------------------------
#' Size of summary groups
#'
#' Return the size of bins used to group the cells together. E.g. if this is
#' 100 then each group annotated in \code{geneCounts} will have summary counts
#' over 100 cells.
#'
#' Note that when the cells are being partitioned, we ensure that the mice do
#' not overlap, thus there will usually be two groups with less than
#' \code{groupSize} number of cells.
#'
#' @param TenXSubset A TenXSubset object
#'
#' @return A numeric vector of indices.
#'
#' @export groupSize
#'
setGeneric("groupSize",
           function(TenXSubset){standardGeneric ("groupSize")})
