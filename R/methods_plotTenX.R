
setMethod(f = "plotTenX",
          signature = signature(object = "TenXSubset",
                                x = "character",
                                y = "character",
                                type = "character",
                                colorByCells = "ANY",
                                colorByGenes = "ANY"),

          definition = function(object, x, y, type,
                                colorByCells = NULL, colorByGenes = NULL,
                                ...){

            #===================================================================
            # cellID on the x axis =============================================
            # View data per cell

            if(x == "cellID"){

              xval <- 1:cellN(object)
              xlabel <- "cell"

              if(y == "transCounts"){
                yval <- cellCountsTrans(object)
                ylabel <- "Total number of transcripts"

              } else if (y == "geneCounts"){
                yval <- cellCountsExpr(object)
                ylabel <- "number of genes expressed per cell"

              } else if (y == "transCountsNorm") {
                yval <- cellCountsTrans(object)/cellCountsExpr(object)
                ylabel <- "average number of transcripts per expressed gene"

              } else {
                stop(invalidSpecifier("y", c("transCounts", "geneCounts",
                                             "transCountsNorm")))
              }

              if(type == "bar"){
                choosePlotBar(object, xval, yval, colorByCells, colorByGenes,
                              xlabel, ylabel, allCellColorSpecifiers)

              } else if (type == "histogram") {
                if(!is.null(colorByCells)){warning(noColorByCells)} else {}
                return(plotHist(yval, ylabel))

              } else {
                stop(invalidSpecifier("type", c("bar", "histogram")))
              }

            #===================================================================
            # genes vs transcripts =============================================
            } else if(x == "geneCounts") {

              xval <- cellCountsExpr(object)
              xlabel <- "number of genes expressed per cell"

              if(y == "transCounts"){
                yval <- cellCountsTrans(object)
                ylabel <- "Total number of transcripts"

              } else if (y == "transCountsNorm") {
                yval <- cellCountsTrans(object)/cellCountsExpr(object)
                ylabel <- "average number of transcripts per expressed gene"

              } else {
                stop(invalidSpecifier("y", "transCounts", "transCountsNorm"))
              }

              if(type == "overlay"){
                choosePlotOverlay(object, xval, yval,
                                  colorByCells, colorByGenes, xlabel, ylabel,
                                  allCellColorSpecifiers)

              } else if(type == "facet"){
                choosePlotFacet(object, xval, yval, colorByCells, colorByGenes,
                                xlabel, ylabel, allCellColorSpecifiers)

              } else {
                stop(invalidSpecifier("type", c("overlay", "facet")))
              }

            #===================================================================
            # groupID on the x axis ============================================
            # View data per group
            } else if(x == "groupID"){

              xval <- cellGroup(object)
              xlabel <- "group ID"

              if(y == "transCounts"){
                yval <- cellCountsTrans(object)
                ylabel <- "number of transcripts cell"

              } else if (y == "geneCounts") {
                yval <- cellCountsExpr(object)
                ylabel <- "number of genes per cell"

              } else if (y == "transCountsNorm") {
                yval <- cellCountsTrans(object)/cellCountsExpr(object)
                ylabel <- "mean transcripts per expressed gene"

              } else {
                stop(invalidSpecifier("y", c("transCounts",
                                             "geneCounts", "transCountsNorm")))
              }

              if(type == "boxplot"){
                choosePlotBoxplot(object, xval, yval, colorByCells, colorByGenes,
                                  xlabel, ylabel, allCellColorSpecifiers[-2])

              } else {
                stop(invalidSpecifier("type", c("boxplot")))
              }

            #===================================================================
            # libID on the x axis ==============================================
            # View data per group
            } else if(x == "libID") {

              xval <- cellLib(object)
              xlabel <- "library ID"

              if(y == "transCounts"){
                yval <- cellCountsTrans(object)
                ylabel <- "number of transcripts cell"

              } else if (y == "geneCounts") {
                yval <- cellCountsExpr(object)
                ylabel <- "number of genes per cell"

              } else if (y == "transCountsNorm") {
                yval <- cellCountsTrans(object)/cellCountsExpr(object)
                ylabel <- "mean transcripts per expressed gene"

              } else {
                stop(invalidSpecifier("y", c("transCounts",
                                             "geneCounts", "transCountsNorm")))
              }

              if(type == "boxplot"){
                choosePlotBoxplot(object, xval, yval, colorByCells, colorByGenes,
                                  xlabel, ylabel, allCellColorSpecifiers[-c(1,2)])

              } else {
                stop(invalidSpecifier("type", c("boxplot")))
              }

            #===================================================================
            # mouseID on the x axis ============================================
            # View data per group
            } else if(x == "mouseID") {

              xval <- cellMouse(object)
              xlabel <- "mouseID"

              if(y == "transCounts"){
                yval <- cellCountsTrans(object)
                ylabel <- "number of transcripts cell"

              } else if (y == "geneCounts") {
                yval <- cellCountsExpr(object)
                ylabel <- "number of genes per cell"

              } else if (y == "transCountsNorm") {
                yval <- cellCountsTrans(object)/cellCountsExpr(object)
                ylabel <- "mean transcripts per expressed gene"

              } else {
                stop(invalidSpecifier("y", c("transCounts",
                                             "geneCounts", "transCountsNorm")))
              }

              if(type == "boxplot"){
                choosePlotBoxplot(object, xval, yval, colorByCells, colorByGenes,
                                  xlabel, ylabel, allCellColorSpecifiers[-c(1,2)])

              } else {
                stop(invalidSpecifier("type", c("boxplot")))
              }

            #===================================================================
            # geneID on the x axis =============================================
            # View data per group
            } else if(x == "geneID") {

              xval <- 1:geneN(object)
              xlabel <- "geneID"

              if(y == "transCounts"){
                yval <- rowSums(geneCounts(object))
                ylabel <- "number of transcripts per gene"

              } else if (y == "cellCounts") {
                yval <- rowSums(geneExpressed(object))
                ylabel <- "number of cells expressing gene"

              } else if (y == "transCountsNorm") {
                yval <- rowSums(geneCounts(object))/rowSums(geneExpressed(object))
                ylabel <- "mean transcripts per cell expressing gene"

              } else {
                stop(invalidSpecifier("y", c("transCounts",
                                             "cellCounts", "transCountsNorm")))
              }

              if(type == "bar"){
                choosePlotBar(object, xval, yval, colorByCells, colorByGenes,
                              xlabel, ylabel, allCellColorSpecifiers[-(1:3)],
                              "gene")

              } else if (type == "histogram") {
                if(!is.null(colorByCells)){warning(noColorByCells)} else {}
                return(plotHist(yval, ylabel))

              } else {
                stop(invalidSpecifier("type", c("bar", "histogram")))
              }

            #===================================================================
            # Update allowed x specifiers as they are added ====================
            } else {
              cat("Invalid x specifier, must be one of:\n")
              cat("cellID, grouID, libID, mouseID, geneID\n")
            }
          })
