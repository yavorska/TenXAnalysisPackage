setMethod(f = "plotTenXMouseExpr",
          signature = signature(summaryExpr = "data.frame",
                                geneName = "character",
                                plot = "character"),

          definition = function(summaryExpr, geneName, plot){

            if(nrow(summaryExpr) > 50000){
              warning("Plotting a large number of points can be very time
                      consuming. Use subsets of cells whenever sufficient.")
            }

            if(!all(c("Mouse", "Cell", "Library") %in% colnames(summaryExpr))){
              stop("Must have 3 columns specifying the Cell, Library, and Mouse
                   associated with each set of counts. If in doubt, use the
                   createSummaryExpr() function to generate the correct type of
                   data.frame")
            } else if (!all(geneName %in% colnames(summaryExpr))) {
              stop("The specified gene name must correspond to a column name in
                   the data.frame.")
            } else {

            }

            # Point plot
            p1 <- ggplot(summaryExpr,
                         aes_string(x = "Cell", y = geneName,
                                    color = "Mouse")) +
              geom_point(alpha = 0.2, stroke = 0, shape = 16) +
              theme_classic() +
              ylab(paste(geneName, "TpC")) + xlab("cell index")


            cellIndexA <- (summaryExpr$Mouse == "A")
            maxA <- max(table(summaryExpr[cellIndexA,geneName]))/
              sum(table(summaryExpr[cellIndexA,geneName]))
            maxB <- max(table(summaryExpr[!cellIndexA,geneName]))/
              sum(table(summaryExpr[!cellIndexA,geneName]))
            maxDenst <- max(maxA, maxB)

            # Stem and leaf plot
            p2 <- ggplot() +
              geom_histogram(data = summaryExpr[cellIndexA,],
                             aes_string(x = geneName,
                                        y = sprintf("-(%s)","..density.."),
                                        fill = "Mouse"),
                             binwidth = 1, alpha = 0.7) +
              geom_histogram(data = summaryExpr[!cellIndexA,],
                             aes_string(x = geneName, y = "..density..",
                                        fill = "Mouse"),
                             binwidth = 1, alpha = 0.7, size = 0) +
              theme_classic() + ylim(-maxDenst, maxDenst) +
              xlab(paste(geneName, "TpC")) + ylab("cell counts") +
              theme(axis.text.x = element_blank(), legend.position = "none") +
              coord_flip()

            # Boxplot
            p3 <- ggplot(summaryExpr,
                         aes_string(x = "Mouse", y = geneName,
                                    color = "Mouse", fill = "Mouse",
                                    group = "Mouse")) +
              geom_boxplot(alpha = 0.7) +
              theme_classic() + theme(legend.position = "none")

            if(plot == "all") {
              grid.arrange(p1 + theme(legend.position = "none"), p2, p3, ncol = 1,
                           layout_matrix = rbind(c(1,1,1,1),
                                                 c(2,2,3,3),
                                                 c(2,2,3,3)))
            } else if (plot == "boxplot") {
              p3
            } else if (plot == "point") {
              p1
            } else if (plot == "hist") {
              p2
            } else {
              stop("plot must be one of boxplot, point, or hist.")
            }
          })
