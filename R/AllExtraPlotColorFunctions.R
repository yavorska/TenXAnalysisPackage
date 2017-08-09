choosePlotBar <- function(object,
                          xval, yval,
                          colorByCells, colorByGenes,
                          xlabel, ylabel,
                          allowedColors,
                          defaultMainGroup = "cells"){

  if(defaultMainGroup == "cells"){
    if(!is.null(colorByGenes)){warning(noColorByGenes)} else {}
    colorBy <- colorByCells
    nXval <- cellN(object)

  } else {
    if(!is.null(colorByCells)){warning(noColorByCells)} else {}
    colorBy <- colorByGenes
    nXval <- geneN(object)

  }

  if(is.numeric(colorBy)) {

    if(all(colorBy %in% 1:nXval)){
      chosenCells <- logical(nXval)
      chosenCells[colorBy] <- TRUE
      return(plotBar(xval, yval, chosenCells, xlabel, ylabel))

    } else {
      stop("Indices must be positive and in the range 1 to ",
           nXval," for this TenXSubset object.")
    }

  } else if (is.logical(colorBy)) {

    if(length(colorByCells) != nXval){
      stop(logicalLengthWrong)

    } else {
      return(plotBar(xval, yval, colorByCells, xlabel, ylabel))
    }

  } else if (is.null(colorBy)) {
    return(plotBar(xval, yval, NULL, xlabel, ylabel))

  } else if (colorBy %in% allowedColors){

      if (colorBy == "group") {
        return(plotBar(xval, yval, cellGroup(object), xlabel, ylabel))

      } else if (colorBy == "lib") {
        return(plotBar(xval, yval, cellLib(object), xlabel, ylabel))

      } else if (colorBy == "mouse") {
        return(plotBar(xval, yval, cellMouse(object), xlabel, ylabel))

      } else {}

  } else {
    if(defaultMainGroup == "cells"){
      stop(invalidSpecifier("colorByCells", allCellColorSpecifiers))
    } else {
      stop(invalidSpecifier("colorByGenes", allCellColorSpecifiers))
    }
  }
}

choosePlotOverlay <- function(object,
                              xval, yval,
                              colorByCells, colorByGenes,
                              xlabel, ylabel,
                              allowedColors){
  nCells <- cellN(object)

  if(!is.null(colorByGenes)){warning(noColorByGenes)} else {}

  if(is.numeric(colorByCells)) {

    if(all(colorByCells %in% 1:nCells)){
      chosenCells <- logical(length(xval))
      chosenCells[colorByCells] <- TRUE
      return(plotPointOverlay(xval, yval, chosenCells, xlabel, ylabel))
    } else {
      stop("Cell indices must be positive and in the range 1 to ",
           nCells," for this TenXSubset object.")
    }

  } else if (is.logical(colorByCells)) {

    if(length(colorByCells) != nCells){
      stop(logicalLengthWrong)
    } else {
      return(plotPointOverlay(xval, yval, colorByCells, xlabel, ylabel))
    }

  } else if (is.null(colorByCells)) {
    return(plotPointOverlay(xval, yval, NULL, xlabel, ylabel))

  } else if (colorByCells %in% allowedColors){

    if (colorByCells == "group") {
      return(plotPointOverlay(xval, yval, cellGroup(object), xlabel, ylabel))
    } else if (colorByCells == "lib") {
      return(plotPointOverlay(xval, yval, cellLib(object), xlabel, ylabel))
    } else if (colorByCells == "mouse") {
      return(plotPointOverlay(xval, yval, cellMouse(object), xlabel, ylabel))
    } else {}

  } else {
    stop(invalidSpecifier("colorByCells", allCellColorSpecifiers))
  }
}

choosePlotFacet <- function(object,
                            xval, yval,
                            colorByCells, colorByGenes,
                            xlabel, ylabel,
                            allowedColors){

  nCells <- cellN(object)

  if(!is.null(colorByGenes)){warning(noColorByGenes)} else {}

  if(length(unique(colorByCells)) > 6){
    stop("We do not suggest creating a facet plot with more than 6 facets.")
  } else {}

  if(is.numeric(colorByCells)) {

    if(all(colorByCells %in% 1:nCells)){
      chosenCells <- logical(length(xval))
      chosenCells[colorByCells] <- TRUE
      return(plotPointFacet(xval, yval, chosenCells, xlabel, ylabel))
    } else {
      stop("Cell indices must be positive and in the range 1 to ",
           nCells," for this TenXSubset object.")
    }

  } else if (is.logical(colorByCells)) {

    if(length(colorByCells) != nCells){
      stop(logicalLengthWrong)
    } else {
      return(plotPointFacet(xval, yval, colorByCells, xlabel, ylabel))
    }

  } else if (is.null(colorByCells)) {
    return(plotPointFacet(xval, yval, NULL, xlabel, ylabel))

  } else if (colorByCells %in% allowedColors){

    if (colorByCells == "group") {
      return(plotPointFacet(xval, yval, cellGroup(object), xlabel, ylabel))
    } else if (colorByCells == "lib") {
      return(plotPointFacet(xval, yval, cellLib(object), xlabel, ylabel))
    } else if (colorByCells == "mouse") {
      return(plotPointFacet(xval, yval, cellMouse(object), xlabel, ylabel))
    } else {}

  } else {
    stop(invalidSpecifier("colorByCells", allCellColorSpecifiers))
  }
}

choosePlotBoxplot <- function(object,
                              xval, yval,
                              colorByCells, colorByGenes,
                              xlabel, ylabel,
                              allowedColors){

  nCells <- cellN(object)

  if(!is.null(colorByGenes)){warning(noColorByGenes)} else {}

  if(is.numeric(colorByCells)) {

    if(all(colorByCells %in% 1:nCells)){
      chosenCells <- logical(length(xval))
      chosenCells[colorByCells] <- TRUE
      return(plotBox(xval, yval, chosenCells, xlabel, ylabel))
    } else {
      stop("Cell indices must be positive and in the range 1 to ",
           nCells," for this TenXSubset object.")
    }

  } else if (is.logical(colorByCells)) {

    if(length(colorByCells) != nCells){
      stop(logicalLengthWrong)
    } else {
      return(plotBox(xval, yval, colorByCells, xlabel, ylabel))
    }

  } else if (is.null(colorByCells)) {
    return(plotBox(xval, yval, NULL, xlabel, ylabel))

  } else if (colorByCells %in% allowedColors){

    if (colorByCells == "group") {
      return(plotBox(xval, yval, as.factor(cellGroup(object)), xlabel, ylabel))
    } else if (colorByCells == "lib") {
      return(plotBox(xval, yval, as.factor(cellLib(object)), xlabel, ylabel))
    } else if (colorByCells == "mouse") {
      return(plotBox(xval, yval, cellMouse(object), xlabel, ylabel))
    } else {}

  } else {
    stop(invalidSpecifier("colorByCells", allCellColorSpecifiers))
  }
}

# xval <- cellGroup(Test_TenXSubset)
# xlabel <- "group ID"
# yval <- cellCountsTrans(Test_TenXSubset)
# ylabel <- "Total number of transcripts per group"
# color <- cellMouse(Test_TenXSubset)
# newColor <- rep(hue_pal()(6), length.out = length(unique(color)))
#
#
# choosePlotBar(Test_TenXSubset, xval, yval, "mouse", NULL, xlabel, ylabel, "bar")
#
# choosePlotOverlay(Test_TenXSubset, cellCountsExpr(Test_TenXSubset), cellCountsTrans(Test_TenXSubset), "group", NULL,
#                   xlabel, ylabel, allCellColorSpecifiers)
#
# choosePlotFacet(Test_TenXSubset, cellCountsExpr(Test_TenXSubset), cellCountsTrans(Test_TenXSubset), "group", NULL,
#                   xlabel, ylabel, allCellColorSpecifiers)
#
# choosePlotBoxplot(Test_TenXSubset, xval, yval, "group", NULL, xlabel, ylabel, allCellColorSpecifiers)
#
