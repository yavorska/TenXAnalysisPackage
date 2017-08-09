#===============================================================================
## Indexing and subsetting

#' Determine group annotations
#'
#' Although this is generally calculated when a new \code{TenXSubset} object is
#' created, sometimes we with to annotate the groups from scratch. This function
#' allows one to annotate the samples into groups of a specified size (using the
#' mouse labeling such that there is no group with two mice).
#'
#' @param groupSize The size of the bin the cells should be grouped by.
#' @param cellN The total number of cells to consider.
#' @param cellMouse The annotation vector partitioning the cells into mouse A
#'        and B.
#'
#' @return A vector of group indices as long as \code{cellN}.
#'
#' @export
#'

setGeneric("determineGroupAnnotations", function(groupSize, cellN, cellMouse){
  standardGeneric("determineGroupAnnotations")})

#-------------------------------------------------------------------------------

#' Determine library annotations
#'
#' Function required by \code{determineLibraryFromGroup} from matches each group
#' with a library (based on majority counts).
#'
#' @param groupSize The size of the bin the cells should be grouped by.
#' @param cellLib The library each of the cells belongs to.
#' @param cellN The total number of cells to consider.
#' @param cellMouse The annotation vector partitioning the cells into mouse A
#'        and B.
#'
#' @return A vector of group indices as long as \code{cellN}.
#'

setGeneric("determineLibraryAnnotations", function(groupSize, cellLib,
                                                   cellN, cellMouse){
  standardGeneric("determineLibraryAnnotations")})

#-------------------------------------------------------------------------------

#' Get indices of cells in a group
#'
#' Given a group index, determine the samples contained in that group. This can
#' be very useful when a group seems to be an outlier and we can not only see
#' which cells belong to that group but also remove them from the subset
#' together with the group quite easily.
#'
#' @param queryGroupIndexVector A numeric vector giving the group indices we
#'        would like to retrieve cell/sample indices from.
#' @param TenXSubset A \code{TenXSubset} object.
#'
#' @return An index vector identifying the cells in this group(s).
#'
#' @export
#'

setGeneric("determineSampleFromGroup",
           function(queryGroupIndexVector, TenXSubset){
             standardGeneric("determineSampleFromGroup")})

#-------------------------------------------------------------------------------

#' Get the library that this group belongs to
#'
#' Given a group index, determine the library the group comes from. In some
#' cases groups can be spread over multiple libraries. In this case the group is
#' assigned to the "majority" library.
#'
#' @param queryGroupIndexVector A numeric vector giving the group indices we
#'        would like to retrieve cell/sample indices from.
#' @param TenXSubset A \code{TenXSubset} object.
#'
#' @return An index vector identifying the cells in this group(s).
#'
#' @export
#'

setGeneric("determineLibraryFromGroup",
           function(queryGroupIndexVector, TenXSubset){
             standardGeneric("determineLibraryFromGroup")})

#-------------------------------------------------------------------------------

#' Get the mouse that this group belongs to
#'
#' Given a group index, determine the mouse that this group of cells came from.
#'
#' @param queryGroupIndexVector A numeric vector giving the group indices we
#'        would like to retrieve cell/sample indices from.
#' @param TenXSubset A \code{TenXSubset} object.
#'
#' @return A character vector identifying the mouse associated with each of
#'         these groups.
#' @export
#'

setGeneric("determineMouseFromGroup",
           function(queryGroupIndexVector, TenXSubset){
             standardGeneric("determineMouseFromGroup")})

#-------------------------------------------------------------------------------

#' Find gene name in data
#'
#' Given a HGNC gene name or ENSEMBL id, find the index of this gene in the data
#' set. This function is not case-sensitive.
#'
#' @param queryGroupIndexVector A numeric vector giving the group indices we
#'        would like to retrieve cell/sample indices from.
#' @param TenXSubset A \code{TenXSubset} object.
#'
#' @return A numeric index of the gene in the data set if the gene is found. The
#'         function throws an error otherwise.
#' @export
#'

setGeneric("determineGeneID",
           function(geneName, TenXSubset){
             standardGeneric("determineGeneID")})

#-------------------------------------------------------------------------------

#' Find GO terms associated with a gene
#'
#' Given a gene HGNC name or EMSEMBL id, find the GO description associated with
#' this gene. This is very useful when analysing outliers in the data.
#'
#' @param geneName A character string giving either the HGNC representation of
#'        the gene or the ENSEMBL id.
#'
#' @return A \code{data.frame} detailing the GO annotations associated with the
#'         chosen gene/genes.
#' @export
#'

setGeneric("determineGOFromGene",
           function(geneName){standardGeneric("determineGOFromGene")})

#-------------------------------------------------------------------------------

#' Find genes associated with a GO term
#'
#' Given a GO term, find the genes annotated with this GO term.
#'
#' @param goTerm The GO id of interest.
#'
#' @return A \code{data.frame} of:
#' \itemize{
#'     \item HGNC gene names
#'     \item ENSEMBL gene ids
#'     \item indices of these genes in our dataset (optional)
#' }
#'
#' @export
#'

setGeneric("determineGeneFromGO",
           function(goTerm){standardGeneric("determineGeneFromGO")})

#-------------------------------------------------------------------------------

#' Find genes containing some query in their GO description
#'
#' Given some query/phrase, find the genes which include this in their GO
#' annotation or description.
#'
#' @param query A character string of interest included in the gene decription.
#'
#' @return A list of genes with this particular phrase in one of their
#'         descriptions.
#'
#' @export
#'

setGeneric("determineGeneFromQuery",
           function(query){standardGeneric("determineGeneFromQuery")})
