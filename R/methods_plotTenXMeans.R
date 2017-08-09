setMethod(f = "plotTenXMeans",
          signature = signature(geneName = "character"),

          definition = function(geneName){

            index <- which(meanDF$geneName == geneName)

            ggplot(data = NULL,
                   aes(x = 1:133, y = as.numeric(meanDF[index, -(1:4)]),
                       color = c(rep("A", 69), rep("B", 64)))) +
              geom_point() +
              theme_classic() +
              xlab("Library") +
              ylab(paste0(geneName, " mean gene expression")) +
              theme(legend.position = "none")

          })
