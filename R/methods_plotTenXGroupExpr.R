setMethod(f = "plotTenXGroupExpr",
          signature = signature(object = "TenXSubset",
                                geneName = "character"),

          definition = function(object, geneName){

            geneIndex <- determineGeneID(geneName, object)
            geneExpr <- as.vector(t(geneCounts(object)[geneIndex,]))
            # Calculate average expression per group
            geneExpr <- geneExpr/as.vector(table(cellGroup(object)))

            temp <- data.frame(Group = cellGroup(object),
                               Lib = cellLib(object))

            groupLibs <- group_by(temp, Group) %>%
              summarise(MeanLibrary = round(mean(Lib)))

            librariesN <- length(unique(groupLibs$MeanLibrary))

            ggplot(data = NULL,
                   aes(x = 1:groupN(object),
                       y = geneExpr,
                       color = as.factor(groupLibs$MeanLibrary))) +

              geom_point(alpha = 0.4) +
              scale_color_manual(values = rep(hue_pal()(10),
                                              length.out = librariesN)) +
              xlab("Group") + ylab("TpC") +
              theme_classic() + theme(legend.position = "none") +
              ggtitle(geneName)
})

