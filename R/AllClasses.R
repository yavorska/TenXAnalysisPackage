#' Class used to represent the grouped TenXData. The object provides summarised
#' information about the chosen subset of cells which can then be analysed using
#' a variety of plotting functions.
#'
#' @slot geneCounts A data.frame with genes as rows and sample groups as
#' columns. Each element represents the total number of transcripts associated
#' with the gene in the chosen cell group.
#' @slot geneExpressed Similar to geneCounts, here we determine the number of cells
#' in which this particular gene is expressed (out of the total number in the
#' group).
#' @slot geneNames The names of the genes associated with each row.
#' @slot geneENSEMBL The ENSEMBL id associated with each row.
#' @slot cellCounts A data.frame which documents the number of transcripts per
#' cell and number of unexpressed genes per cell. These can be accessed through
#' "cellTranscripts" and "cellExpressed"
#' @slot cellMouse A vector giving the mouse associated with each cell.
#' @slot cellLib The library associated with each cell in the data.
#' @slot cellGroup The group associated with each cell in the data,
#' characterised by \code{groupSize}.
#' @slot cellN The number of cells included in this data set.
#' @slot groupN The number of distinct groups of those samples.
#' @slot libN The number of distinct libraries to which the cells belong.
#' @slot geneN The number of genes for which we have associated counts.
#' @slot cellIndex The cells used in this subset relative to the original
#' 1.3 million cell data.
#' @slot geneIndex The genes included in this subset.
#' @slot groupSize The size of the bins used to summarise the data.

setClass("TenXSubset",
         representation   = representation(

           geneCounts     = "data.frame", # Required
           geneExpressed  = "data.frame", # Required

           geneNames      = "character", # Required
           geneENSEMBL    = "character", # Required

           cellCounts     = "data.frame", # Required
           cellMouse      = "character", # Required
           cellLib        = "numeric", # Required
           cellGroup      = "numeric", # Calculated

           cellN          = "numeric", # Calculated
           groupN         = "numeric", # Calculated
           libN           = "numeric", # Calculated
           geneN          = "numeric", # Calculated

           cellIndex      = "numeric", # Required or in parameters
           geneIndex      = "numeric", # Required or in parameters

           groupSize      = "numeric")) # Required or in parameters



