setMethod(f = "plotTenXGeneGO",
          signature = signature(object = "TenXSubset",
                                geneName = "character"),

          definition = function(object, geneName){

            # Step 1. Determine which GO terms we need.
            geneVec <- NULL
            for(i in 1:length(geneName)){
              geneVec <- c(geneVec, determineGOFromGene(geneName[i])$name_1006)
            }

            geneVec <- geneVec[geneVec != ""]

            # Step 2. Plot the top 10 as a bar plot.
            freqTable <- table(geneVec)

            if(length(freqTable) > 10){
              freqTable <- freqTable[1:10]
            } else {

            }

            ggplot(data = NULL, aes(x = factor(names(freqTable),
                                               levels = names(freqTable)[
                                                 order(as.vector(freqTable),
                                                       decreasing = TRUE)]),
                                    y = as.vector(freqTable))) +
              geom_bar(stat = "identity",
                       color = "red", fill = "red", alpha = 0.5) +
              theme_classic() +
              theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
              ylab("Counts") +
              xlab("GO id")
          })
