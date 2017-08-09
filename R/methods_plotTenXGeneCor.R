setMethod(f = "plotTenXGeneCor",
          signature = signature(object = "TenXSubset",
                                geneName = "character"),

          definition = function(object, geneName){

            geneCountsMat <- as.matrix(geneCounts(object))
            genesPerGroup <- as.vector(table(cellGroup(object)))
            geneCountsMat <- t(geneCountsMat)/genesPerGroup
            colnames(geneCountsMat) <- geneNames(object)

            Index <- determineGeneID(geneName, object)
            corMarkers <- cor(geneCountsMat[,Index])

            return(corrplot(corMarkers,
                            method = "color", order = "hclust"))

})
