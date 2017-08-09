setMethod(f = "plotTenXGO",
          signature = signature(object = "TenXSubset",
                                goId = "character"),

          definition = function(object, goId){

            # Step 1. Determine which genes we are working with and the
            #         corresponding values.
            geneVec <- determineGeneFromGO(goId)
            geneVec <- geneNames(object) %in% geneVec$Symbol

            # Step 2. Draw the relevant plots with the gene highlighted
            geneDF <- data.frame(Gene = geneNames(object),
                                 Trans = rowSums(geneCounts(object)),
                                 Cells = rowSums(geneExpressed(object)),
                                 NormTrans =
                                   rowSums(geneCounts(object))/
                                   rowSums(geneCounts(object) != 0),
                                 SelectedGene = geneVec)
            valuesDF <- geneDF[geneVec, 1:4]

            geneDF <- geneDF[geneDF$Cells > 0,]

            meltedGeneDF <- melt(geneDF, id = c("Gene", "SelectedGene"))

            meltedGeneDF <- meltedGeneDF %>%
              ungroup() %>%
              arrange(variable, value) %>%
              mutate(rowVal = row_number())

            meltedGeneDF$rowVal[meltedGeneDF$variable == "NormTrans"] <-
              rank(meltedGeneDF$rowVal[meltedGeneDF$variable == "NormTrans"])
            meltedGeneDF$rowVal[meltedGeneDF$variable == "Cells"] <-
              rank(meltedGeneDF$rowVal[meltedGeneDF$variable == "Cells"])

            plot(ggplot(meltedGeneDF,
                        aes(x = rowVal, y = value,
                            color = SelectedGene,
                            alpha = SelectedGene,
                            size = SelectedGene)) +
                   geom_point() +
                   scale_alpha_manual(values = c(0.2,1)) +
                   scale_size_manual(values = c(0.5,1)) +
                   scale_color_manual(values = c("gray", "red")) +
                   facet_grid(variable~., scales = "free") +
                   theme_classic() + theme(legend.position = "none") +
                   xlab("Sorted gene statistics") +
                   ggtitle(paste0(goId, " related gene counts")))

            return(valuesDF[order(valuesDF$Trans, decreasing = TRUE),])

          })
