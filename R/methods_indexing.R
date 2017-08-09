#-------------------------------------------------------------------------------
# Return a vector of group annotations
setMethod(f = "determineGroupAnnotations",
          signature = signature(groupSize = "numeric",
                                cellN = "integer",
                                cellMouse = "character"),

          definition = function(groupSize, cellN, cellMouse){

            mouseA.index <- which(cellMouse == "A")
            if(length(mouseA.index) > 0){
              mouseA.groups <- ceiling(max(mouseA.index)/groupSize)
              mouseA.annotations <- rep(1:mouseA.groups, each = groupSize)
              mouseA.annotations <- mouseA.annotations[1:length(mouseA.index)]
            } else {
              mouseA.annotations <- NULL
              mouseA.groups <- 0
            }

            mouseB.index <- which(cellMouse == "B")
            if(length(mouseA.index) > 0){
              mouseB.index <- mouseB.index - min(mouseB.index)
              mouseB.groups <- ceiling(max(mouseB.index)/groupSize)
              mouseB.annotations <- rep(1:mouseB.groups, each = groupSize)
              mouseB.annotations <- mouseB.annotations[1:length(mouseB.index)] +
                mouseA.groups
            } else {
              mouseB.annotations <- NULL
            }

            if(length(mouseA.index) + length(mouseB.index) == 0){
              stop("cellMouse must be a vector of A and B mouse classifiers.")
            }

            return(c(mouseA.annotations, mouseB.annotations))

          })

#-------------------------------------------------------------------------------
# Determine the most frequent library per group
setMethod(f = "determineLibraryAnnotations",
          signature = signature(groupSize = "integer",
                                cellLib = "numeric",
                                cellN = "integer",
                                cellMouse = "character"),

          definition = function(groupSize, cellLib, cellN, cellMouse){

            group.annotation <- determineGroupAnnotations(groupSize,
                                                          cellN,
                                                          cellMouse)

            # The group and library associated with each cell
            temp <- data.frame(Group = group.annotation, Lib = cellLib)
            mapping <- group_by(temp, Group) %>%
              summarise(MeanLibrary = round(mean(Lib)))

            return(mapping)

          })

#-------------------------------------------------------------------------------
# Given a vector of groups, determine the cells that are included
setMethod(f = "determineSampleFromGroup",
          signature = signature(queryGroupIndexVector = "numeric",
                                TenXSubset = "TenXSubset"),

          definition = function(queryGroupIndexVector, TenXSubset){
            index <- which(cellGroup(TenXSubset) %in% queryGroupIndexVector)
            return(cellIndex(TenXSubset)[index])
          })

#-------------------------------------------------------------------------------

setMethod(f = "determineLibraryFromGroup",
          signature = signature(queryGroupIndexVector = "numeric",
                                TenXSubset = "TenXSubset"),

          definition = function(queryGroupIndexVector, TenXSubset){
            index <- which(cellGroup(TenXSubset) %in% queryGroupIndexVector)
            return(cellLib(TenXSubset)[index])
          })

#-------------------------------------------------------------------------------

setMethod(f = "determineMouseFromGroup",
          signature = signature(queryGroupIndexVector = "numeric",
                                TenXSubset = "TenXSubset"),

          definition = function(queryGroupIndexVector, TenXSubset){

            if(!all(queryGroupIndexVector %in% unique(cellGroup(TenXSubset)))){
              stop("Not all groups in queryGroupIndexVector are in the
                   TenXSubset object specified.")
            }

            mouseVec <- NULL
            for(i in 1:length(queryGroupIndexVector)){
              index <- which(cellGroup(TenXSubset) %in% queryGroupIndexVector[i])[1]
              mouseVec <- c(mouseVec, cellMouse(TenXSubset)[index])
            }

            return(mouseVec)
          })

#-------------------------------------------------------------------------------

setMethod(f = "determineGeneID",
          signature = signature(geneName = "character", TenXSubset = "TenXSubset"),

          definition = function(geneName, TenXSubset){

            if(all(toupper(geneName) %in% toupper(geneNames(TenXSubset)))) {
              vec <- match(toupper(geneName), toupper(geneNames(TenXSubset)))

              if(length(vec) > length(geneName)) {
                stop("Multiple genes under this name! Use ENSEMBL ids instead")
              } else {
                return(vec)
              }

            } else if (all(toupper(geneName) %in% toupper(geneENSEMBL(TenXSubset)))){
              return(match(toupper(geneName), toupper(geneENSEMBL(TenXSubset))))

            } else {
              stop("Gene name not found!")
            }

          })

#-------------------------------------------------------------------------------

setMethod(f = "determineGOFromGene",
          signature = signature(geneName = "character"),

          definition = function(geneName){

            geneName <- toupper(geneName)

            ensInd <- which(toupper(TenXse_rowData$Ensembl) == geneName)
            hgnInd <- which(toupper(TenXse_rowData$Symbol) == geneName)

            geneName <- TenXse_rowData$Ensembl[union(ensInd, hgnInd)]

            geneInd <- which(EG2GO$ensembl_gene_id %in% geneName)

            return(EG2GO[geneInd, 2:3])

          })

#-------------------------------------------------------------------------------

setMethod(f = "determineGeneFromGO",
          signature = signature(goTerm = "character"),

          definition = function(goTerm){

            goInd <- which(EG2GO$name_1006 == goTerm)

            if(length(goInd) == 0){
              stop("Specified GO id not found!")
            } else {
              ensNames <- EG2GO$ensembl_gene_id[goInd]
              return(TenXse_rowData[TenXse_rowData$Ensembl %in% ensNames,])
            }

          })

#-------------------------------------------------------------------------------

setMethod(f = "determineGeneFromQuery",
          signature = signature(query = "character"),

          definition = function(query){

            description1 <- grep(query, EG2GO$name_1006, ignore.case = TRUE)
            description2 <- grep(query, EG2GO$description, ignore.case = TRUE)

            geneInd <- union(description1, description2)

            if(length(geneInd) == 0){
              stop("Specified phrase not found!")
            } else {
              ensNames <- EG2GO$ensembl_gene_id[geneInd]
              return(TenXse_rowData[TenXse_rowData$Ensembl %in% ensNames,])
            }

          })
