setMethod(f = "generateSummaryExpr",
          signature = signature(TenXSubset = "TenXSubset"),

          definition = function(TenXSubset){

            if(groupSize(TenXSubset) != 1){
              stop("Groups must contain one cell each.")

            } else {
              counts <- t(geneCounts(TenXSubset))
              colnames(counts) <- geneNames(TenXSubset)

              groupDF <- data.frame(Cell = cellIndex(TenXSubset),
                                    Library = cellLib(TenXSubset),
                                    Mouse = cellMouse(TenXSubset),
                                    counts)

              return(groupDF)
            }
})

