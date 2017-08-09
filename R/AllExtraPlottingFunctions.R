# Simplifying the plotting strategy

plotBar <- function(x, y, color, labX, labY){

  if(is.null(color)) {

    ggplot(data = NULL,
           aes(x = x, y = y)) +
      geom_bar(stat = "identity", alpha = 0.6, color = "gray", fill = "gray") +
      theme_classic() +
      xlab(labX) + ylab(labY)

  } else {

    if(length(unique(color)) > 6){

      newColor <- rep(hue_pal()(6), length.out = length(unique(color)))

      ggplot(data = NULL,
             aes(x = x, y = y,
                 fill = as.factor(color),
                 color = as.factor(color))) +
        geom_bar(stat = "identity", alpha = 0.6) +

        scale_color_manual("Partition", values = newColor) +
        scale_fill_manual("Partition", values = newColor) +

        theme_classic() +
        xlab(labX) + ylab(labY) + theme(legend.position = "none")

    } else {
      ggplot(data = NULL,
             aes(x = x, y = y,
                 fill = as.factor(color),
                 color = as.factor(color))) +
        geom_bar(stat = "identity", alpha = 0.6) +

        scale_color_discrete("Partition") +
        scale_fill_discrete("Partition") +

        theme_classic() +
        xlab(labX) + ylab(labY)
    }

  }
}

plotHist <- function(x, labX){
  ggplot(data = NULL,
         aes(x = x)) +
    geom_histogram(bins = 200, fill = "gray", color = "gray") +
    theme_classic() +
    xlab(labX)
}

plotPointOverlay <- function(x, y, color, labX, labY){

  alpha.val <- 0.5

  if(is.null(color)){
    ggplot(data = NULL, aes(x = x, y = y)) +
      geom_point(alpha = alpha.val) +
      theme_classic() +
      xlab(labX) + ylab(labY)

  } else {

    if(length(unique(color)) > 6){
      newColor <- rep(hue_pal()(6), length.out = length(unique(color)))

      ggplot(data = NULL,
             aes(x = x, y = y,
                 fill = as.factor(color),
                 color = as.factor(color))) +
        geom_point(alpha = alpha.val) +

        scale_color_manual("Partitioning", values = newColor) +
        scale_fill_manual("Partitioning", values = newColor) +

        theme_classic() +
        xlab(labX) + ylab(labY) + theme(legend.position = "none")

    } else {
      ggplot(data = NULL,
             aes(x = x, y = y,
                 fill = as.factor(color),
                 color = as.factor(color))) +
        geom_point(alpha = alpha.val) +
        scale_color_discrete("Partitioning") +
        scale_fill_discrete("Partitioning") +
        theme_classic() +
        xlab(labX) + ylab(labY)
    }
  }
}

plotPointFacet <- function(x, y, color, labX, labY){

  if(is.null(color)){
    cat("Invalid color specifier.\n")
    cat("Faceting requires a variable to split the data by.\n")

  } else if(length(unique(color)) > 5) {
    cat("Too many facets to consider!\n")
    cat("Please choose a partitioning with less than 6 groups.\n")

  } else {

    dftemp <- data.frame(x = x, y = y, color = as.factor(color))

    ggplot(data = dftemp, aes(x = x, y = y)) +
      geom_point(alpha = 0.5) +
      facet_grid(.~ color) +
      theme_classic() +
      xlab("xlabel") + ylab("ylabel")
  }
}

plotBox <- function(x, y, color, labX, labY){

  newColor <- rep(hue_pal()(6), length.out = length(unique(color)))

  ggplot(data = NULL,
         aes(x = x, y = y, group = x,
             color = color, fill = color)) +
    geom_boxplot(alpha = 0.4) +
    scale_color_manual("Partitioning", values = newColor) +
    scale_fill_manual("Partitioning", values = newColor) +
    theme_classic() +
    xlab(labX) + ylab(labY)

}

plotRank <- function(xVal, name, queryIndex, labY, label = TRUE){

  if(label){
    labelText <- paste0(name[queryIndex], " rank = ",
                        format(round(rank(xVal)[queryIndex], 3), n.small = 3),
                        "\n",
                        "Value = ",
                        format(round(xVal[queryIndex], 3), n.small = 3))

    ggplot(data = NULL, aes(x = rank(xVal), y = xVal)) +
      geom_point(color = "gray") +
      theme_classic() +
      geom_point(data = NULL,
                 aes(x = rank(xVal)[queryIndex], y = xVal[queryIndex]),
                 color = "red") +
      geom_label(data = NULL,
                 aes(x = rank(xVal)[queryIndex], y = xVal[queryIndex],
                     label = labelText),
                 nudge_y = 0, vjust = "inward", hjust = "inward",
                 color = "red", label.size = 0.25, alpha = 0.5) +
      xlab("Rank") +
      ylab(labY)
  } else {

    ggplot(data = NULL, aes(x = rank(xVal), y = xVal)) +
      geom_point(color = "gray") +
      theme_classic() +
      geom_point(data = NULL,
                 aes(x = rank(xVal)[queryIndex], y = xVal[queryIndex]),
                 color = "red", alpha = 0.8) +
      xlab("Rank") +
      ylab(labY)
  }
}
