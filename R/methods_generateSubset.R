setMethod(f = "generateSubset",
          signature = signature(cellIndex = "numeric",
                                geneIndex = "numeric",
                                groupSize = "numeric",
                                path = "character"),

          definition = function(cellIndex, geneIndex, groupSize, path){

            subsetCellN <- length(cellIndex)
            subsetGeneN <- length(geneIndex)
            subsetGroupN <- ceiling(subsetCellN/groupSize)
            subsetCellGroup <- rep(1:subsetGroupN,
                                   length = subsetCellN,
                                   each = groupSize)

            # Gene-cell matrix for gene and transcript counts
            subsetGeneExpressed <- subsetGeneCounts <-
              matrix(NA, nrow = subsetGeneN, ncol = subsetGroupN)
            # Cell df for total transcript and gene counts
            subsetCellCounts <- matrix(NA, nrow = subsetCellN, ncol = 2)
            colnames(subsetCellCounts) <- c("nTrans", "nGenesExpr")

            if(groupSize == 1){

              nGroups <- subsetCellN/1000

              for(run in 1:ceiling(nGroups)){

                cat("run ", run, " of ", ceiling(nGroups), "\n")

                runIndex <- ((run-1)*1000 + 1):min(1000*run, subsetCellN)

                seMatrix <-
                  assay(matrixSummarizedExperiment(path,
                                                   i = geneIndex,
                                                   j = cellIndex[runIndex]))
                seMatrixBinary <-
                  ifelse(seMatrix == 0, 0, 1)

                subsetGeneExpressed[,runIndex] <- seMatrixBinary
                subsetGeneCounts[,runIndex] <- seMatrix

                subsetCellCounts[runIndex,1] <- colSums(seMatrix)
                subsetCellCounts[runIndex,2] <- colSums(seMatrixBinary)
              }

            } else {
              for(run in 1:subsetGroupN){
                cat("run ", run, " of ", subsetGroupN, "\n")

                runIndex <- (groupSize*(run-1) + 1):min(groupSize*run,
                                                        subsetCellN)

                seMatrix <-
                  assay(matrixSummarizedExperiment(path,
                                                   i = geneIndex,
                                                   j = cellIndex[runIndex]))
                seMatrixBinary <-
                  ifelse(seMatrix == 0, 0, 1)

                subsetGeneExpressed[,run] <-
                  rowSums(seMatrixBinary)/length(runIndex)
                subsetGeneCounts[,run] <- rowSums(seMatrix)

                subsetCellCounts[runIndex,1] <- colSums(seMatrix)
                subsetCellCounts[runIndex,2] <- colSums(seMatrixBinary)
              }
            }

            return(new("TenXSubset",
                       geneCounts = data.frame(subsetGeneCounts),
                       geneExpressed = data.frame(subsetGeneExpressed),

                       geneNames = as.vector(TenXse_rowData$Symbol[geneIndex]),
                       geneENSEMBL = TenXse_rowData$Ensembl[geneIndex],

                       cellCounts = data.frame(subsetCellCounts),

                       cellMouse = as.character(TenXse_colData$Mouse[cellIndex]),
                       cellLib = TenXse_colData$Library[cellIndex],
                       cellGroup = subsetCellGroup,
                       cellN = subsetCellN,
                       groupN = subsetGroupN,
                       libN = length(unique(TenXse_colData$Library[cellIndex])),
                       geneN = subsetGeneN,

                       cellIndex = cellIndex,
                       geneIndex = geneIndex,
                       groupSize = groupSize))

})
