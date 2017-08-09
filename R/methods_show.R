setMethod(f = "show",
          signature = "TenXSubset",
          definition = function(object){

            cat("*** TenXSubset *** \n")
            cat("Number of cells = "); print(object@cellN)
            cat("Number of genes = "); print(object@geneN)

            cat("Number of cells partitioned by mouse:"); print(table(object@cellMouse))

            cat("\nSome idea of what the data looks like:\n")
            cat("\ngeneCounts subset:\n"); print(object@geneCounts[1:5, 1:4])
            cat("\ncellCounts subset:\n"); print(head(object@cellCounts))

            cat("*** End *** \n")
          })
