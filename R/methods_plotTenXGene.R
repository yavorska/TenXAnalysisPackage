setMethod(f = "plotTenXGene",
          signature = signature(object = "TenXSubset",
                                geneName = "character"),

          definition = function(object, geneName){

            nBins <- 200
            # Step 1. Determine which gene we are working with and the
            #         corresponding values.
            geneVec <- rep(FALSE, geneN(object))
            geneVec[determineGeneID(geneName, object)] <- TRUE

            if(sum(geneVec) > 2){
              stop("Multiple genes found with this name!
                   Use ENSEMBL ids instead.")
            }

            geneDF <- data.frame(Gene = geneNames(object),
                                 Trans = rowSums(geneCounts(object)),
                                 Cells = rowSums(geneExpressed(object)),
                                 NormTrans =
                                   rowSums(geneCounts(object))/
                                   rowSums(geneCounts(object) != 0),
                                 SelectedGene = geneVec)

            toReturn <- geneDF[geneVec, 1:4]
            geneDF <- geneDF[geneDF$Cells > 0,]

            meltedGeneDF <- melt(geneDF, id = c("Gene", "SelectedGene"))

            meltedGeneDF <- meltedGeneDF %>%
              ungroup() %>%   # As a precaution / handle in a separate .grouped_df method
              arrange(variable, value) %>%   # arrange by facet variables and continuous values
              mutate(rowVal = row_number()) # Add a row number variable

            meltedGeneDF$rowVal[meltedGeneDF$variable == "NormTrans"] <-
              rank(meltedGeneDF$rowVal[meltedGeneDF$variable == "NormTrans"])
            meltedGeneDF$rowVal[meltedGeneDF$variable == "Cells"] <-
              rank(meltedGeneDF$rowVal[meltedGeneDF$variable == "Cells"])

            #return(meltedGeneDF)
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
              ggtitle(paste0(geneName, " counts relative to other genes")))

            return(toReturn)
})
