setMethod(f = "plotTenXGenePair",
          signature = signature(object = "TenXSubset",
                                geneName1 = "character",
                                geneName2 = "character"),

          definition = function(object, geneName1, geneName2){

            geneIndex <- determineGeneID(c(geneName1, geneName2), object)

            geneExpr <- geneCounts(object)[geneIndex,]
            geneExpr <- apply(geneExpr, 1,
                              function(x) x/table(cellGroup(object)))
            colnames(geneExpr) <- c(geneName1, geneName2)

            genePlot <- ggplot(data.frame(geneExpr),
                               aes_string(x = geneName1, y = geneName2)) +
              geom_point(color = "gray", alpha = 0.4) +
              theme_classic()

            ggMarginal(genePlot, type = "histogram")
})
