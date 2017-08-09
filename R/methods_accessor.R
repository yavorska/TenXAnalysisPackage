setMethod(f = "geneCounts",
          signature = "TenXSubset",
          definition = function(TenXSubset){
            temp <- TenXSubset@geneCounts
            rownames(temp) <- TenXSubset@geneENSEMBL
            return(temp)
          })

setMethod(f = "geneExpressed",
          signature = "TenXSubset",
          definition = function(TenXSubset){
            temp <- TenXSubset@geneExpressed
            rownames(temp) <- TenXSubset@geneENSEMBL
            return(temp)
          })

setMethod(f = "geneNames",
          signature = "TenXSubset",
          definition = function(TenXSubset){return(TenXSubset@geneNames)})

setMethod(f = "geneENSEMBL",
          signature = "TenXSubset",
          definition = function(TenXSubset){return(TenXSubset@geneENSEMBL)})

#-------------------------------------------------------------------------------
setMethod(f = "cellCounts",
          signature = "TenXSubset",
          definition = function(TenXSubset){return(TenXSubset@cellCounts)})
setMethod(f = "cellCountsTrans",
          signature = "TenXSubset",
          definition = function(TenXSubset){return(TenXSubset@cellCounts[,1])})
setMethod(f = "cellCountsExpr",
          signature = "TenXSubset",
          definition = function(TenXSubset){return(TenXSubset@cellCounts[,2])})
#-------------------------------------------------------------------------------

setMethod(f = "cellMouse",
          signature = "TenXSubset",
          definition = function(TenXSubset){return(TenXSubset@cellMouse)})

setMethod(f = "cellLib",
          signature = "TenXSubset",
          definition = function(TenXSubset){return(TenXSubset@cellLib)})

setMethod(f = "cellGroup",
          signature = "TenXSubset",
          definition = function(TenXSubset){return(TenXSubset@cellGroup)})

setMethod(f = "cellN",
          signature = "TenXSubset",
          definition = function(TenXSubset){return(TenXSubset@cellN)})

setMethod(f = "groupN",
          signature = "TenXSubset",
          definition = function(TenXSubset){return(TenXSubset@groupN)})

setMethod(f = "libN",
          signature = "TenXSubset",
          definition = function(TenXSubset){return(TenXSubset@libN)})

setMethod(f = "geneN",
          signature = "TenXSubset",
          definition = function(TenXSubset){return(TenXSubset@geneN)})

setMethod(f = "cellIndex",
          signature = "TenXSubset",
          definition = function(TenXSubset){return(TenXSubset@cellIndex)})

setMethod(f = "geneIndex",
          signature = "TenXSubset",
          definition = function(TenXSubset){return(TenXSubset@geneIndex)})

setMethod(f = "groupSize",
          signature = "TenXSubset",
          definition = function(TenXSubset){return(TenXSubset@groupSize)})
