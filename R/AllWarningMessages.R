noColorByGenes <- paste("Cannot color by genes in this case. Ignoring colorByGenes argument.")
noColorByCells <- paste("Cannot color by cells in this case. Ignoring colorByCells argument.")
logicalLengthWrong <- paste("Length of indexing vector does not match length of variable.\n")

invalidSpecifier <- function(parameter, allowedParameters){
  paste0("Invalid ", parameter, " specifier, must be one of:\n",
        paste(allowedParameters, collapse = ", "), ".")
}

allCellColorSpecifiers <- c("group", "lib", "mouse", "numeric", "logical", "null")
