#
# # # Generating example/default data set
#
# sampleList <- PipelineResultAllGenes50000
#
# Test_TenXSubset <- new("TenXSubset",
#                        geneCounts = sampleList[[1]][,-1],
#                        geneExpressed = sampleList[[2]][,-1],
#
#                        geneNames = as.vector(sampleList[[1]][,1]),
#                        geneENSEMBL = TenXse_rowData$Ensembl[(sampleList[[6]])],
#
#                        cellCounts = data.frame(nTrans = sampleList[[3]][,1],
#                                                nGenesExpr = sampleList[[3]][,2]),
#                        cellMouse = sampleList[[4]],
#                        cellLib = TenXse_colData$Library[(sampleList[[5]])],
#                        cellGroup = determine.group.annotations(groupSize_good,
#                                                                cellN_good,
#                                                                cellMouse_good),
#
#                        cellN = nrow(sampleList[[3]]),
#                        groupN = length(unique(determine.group.annotations(groupSize_good,
#                                                                           cellN_good,
#                                                                           cellMouse_good))),
#
#                        libN = length(unique(TenXse_colData$Library[(sampleList[[5]])])),
#                        geneN = nrow(sampleList[[1]]),
#
#                        cellIndex = sampleList[[5]],
#                        geneIndex = sampleList[[6]],
#
#                        groupSize = 10000
#                        )
#
# # Currently
# # - geneExpressed shows the number of unexpressed genes, want this to be an
# #   average per cell rather than overall count per group
# # - cellCounts$nGeneExpr shows the number of unexpressed genes, want this to be
# #   a proportion rather than a count
# Test_TenXSubset@cellCounts$nGenesExpr <- Test_TenXSubset@geneN - Test_TenXSubset@cellCounts$nGenesExpr
#
# cellsPerGroup <- as.vector(table(cellGroup(Test_TenXSubset)))
# # Calculate the number of cells expressed per group and then normalise by the number of cells in the group
# Test_TenXSubset@geneExpressed <- -sweep(Test_TenXSubset@geneExpressed, 2, cellsPerGroup, "-")
# Test_TenXSubset@geneExpressed <- sweep(Test_TenXSubset@geneExpressed, 2, cellsPerGroup, "/")
#
# save(Test_TenXSubset, file = "Test_TenXSubset.RData")
