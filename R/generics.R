#' @include zzz.R
#'
NULL

#' Add in metadata associated with either cells or features.
#'
#' Adds additional data to the object. Can be any piece of information
#' associated with a cell (examples include read depth, alignment rate,
#' experimental batch, or subpopulation identity) or feature (ENSG name,
#' variance). To add cell level information, add to the Seurat object. If adding
#' feature-level metadata, add to the Assay object (e.g. object[["RNA"]]))
#'
#' @param x,object An object
#' @param i,col.name Name to store metadata or object as
#' @param value,metadata Metadata or object to add
#' @param j Ignored
#' @param ... Arguments passed to other methods
#'
#' @return An object with metadata or and object added
#'
#' @rdname AddMetaData
#' @export AddMetaData
#'
#' @aliases SeuratAccess
#'
#' @examples
#' cluster_letters <- LETTERS[Idents(object = pbmc_small)]
#' names(cluster_letters) <- colnames(x = pbmc_small)
#' pbmc_small <- AddMetaData(
#'   object = pbmc_small,
#'   metadata = cluster_letters,
#'   col.name = 'letter.idents'
#' )
#' head(x = pbmc_small[[]])
#'
AddMetaData <- function(object, metadata, col.name = NULL) {
  UseMethod(generic = 'AddMetaData', object = object)
}

#' Graph Converter
#'
#' Convert a \code{\link[base]{matrix}} (or \code{\link[Matrix]{Matrix}}) to the
#' \code{\link{Graph}} class
#'
#' @param x The matrix to convert
#' @param ... Arguments passed to other methods (ignored for now)
#'
#' @return A \code{\link{Graph}} object
#'
#' @rdname as.Graph
#' @export as.Graph
#'
as.Graph <- function(x, ...) {
  UseMethod(generic = "as.Graph", object = x)
}

#' Convert objects to Seurat objects
#'
#' @param x An object to convert to class \code{Seurat}
#' @param ... Arguments passed to other methods
#'
#' @rdname as.Seurat
#' @export as.Seurat
#'
as.Seurat <- function(x, ...) {
  UseMethod(generic = 'as.Seurat', object = x)
}

#' Cast to Sparse
#'
#' Convert dense objects to sparse representations
#'
#' @param x An object
#' @param ... Arguments passed to other methods
#'
#' @return A sparse representation of the input data
#'
#' @rdname as.sparse
#' @export as.sparse
#'
as.sparse <- function(x, ...) {
  UseMethod(generic = 'as.sparse', object = x)
}

#' Get cells present in an object
#'
#' @param x An object
#'
#' @return A vector of cell names
#'
#' @rdname Cells
#' @export Cells
#'
#' @examples
#' Cells(x = pbmc_small)
#'
Cells <- function(x) {
  UseMethod(generic = 'Cells', object = x)
}

#' Get SeuratCommands
#'
#' Pull information on previously run commands in the Seurat object.
#'
#' @param object An object
#' @param ... Arguments passed to other methods
#'
#' @return Either a SeuratCommand object or the requested paramter value
#'
#' @rdname Command
#' @export Command
#'
Command <- function(object, ...) {
  UseMethod(generic = 'Command', object = object)
}

#' Default Assay
#'
#' Get and set the default assay
#'
#' @param object An object
#' @param ... Arguments passed to other methods
#'
#' @return \code{DefaultAssay}: The name of the default assay
#'
#' @rdname DefaultAssay
#' @export DefaultAssay
#'
DefaultAssay <- function(object, ...) {
  UseMethod(generic = 'DefaultAssay', object = object)
}

#' @param value Name of assay to set as default
#'
#' @return \code{DefaultAssay<-}: An object with the default assay updated
#'
#' @rdname DefaultAssay
#' @export DefaultAssay<-
#'
"DefaultAssay<-" <- function(object, ..., value) {
  UseMethod(generic = 'DefaultAssay<-', object = object)
}

#' Get cell embeddings
#'
#' @param object An object
#' @param ... Arguments passed to other methods
#'
#' @rdname Embeddings
#' @export Embeddings
#'
Embeddings <- function(object, ...) {
  UseMethod(generic = 'Embeddings', object = object)
}

#' Get an Assay object from a given Seurat object.
#'
#' @param object An object
#' @param ... Arguments passed to other methods
#'
#' @return Returns an Assay object
#'
#' @rdname GetAssay
#' @export GetAssay
#'
GetAssay <- function(object, ...) {
  UseMethod(generic = 'GetAssay', object = object)
}

#' General accessor function for the Assay class
#'
#' This function can be used to pull information from any of the slots in the
#' Assay class. For example, pull one of the data matrices("counts", "data", or
#' "scale.data").
#'
#' @param object An object
#' @param ... Arguments passed to other methods
#'
#' @return Returns info from requested slot
#'
#' @rdname GetAssayData
#' @export GetAssayData
#'
GetAssayData <- function(object, ...) {
  UseMethod(generic = 'GetAssayData', object = object)
}

#' Get image data
#'
#' @param object An object
#' @param mode How to return the image; should accept one of 'grob', 'raster',
#' 'plotly', or 'raw'
#' @param ... Arguments passed to other methods
#'
#' @return Image data, varying depending on the value of \code{mode}:
#' \describe{
#'  \item{'grob'}{An object representing image data inheriting from \code{grob} objects (eg. \code{rastergrob})}
#'  \item{'raster'}{An object of class \code{raster}}
#'  \item{'plotly'}{A list with image data suitable for Plotly rendering, see \code{\link[plotly]{layout}} for more details}
#'  \item{'raw'}{The raw image data as stored in the object}
#' }
#'
#' @seealso \code{\link[plotly]{layout}}
#'
#' @rdname GetImage
#' @export GetImage
#'
GetImage <- function(object, mode = c('grob', 'raster', 'plotly', 'raw'), ...) {
  mode <- match.arg(arg = mode)
  UseMethod(generic = 'GetImage', object = object)
}

#' Get tissue coordinates
#'
#' Get tissue coordinates
#'
#' @param object An object
#' @param ... Arguments passed to other methods
#'
#' @return A data.frame with tissue coordinates
#'
#' @rdname GetTissueCoordinates
#' @export GetTissueCoordinates
#'
GetTissueCoordinates <- function(object, ...) {
  UseMethod(generic = 'GetTissueCoordinates', object = object)
}

#' Get highly variable feature information
#'
#' @param object An object
#' @param ... Arguments passed to other methods
#'
#' @return A dataframe with feature means, dispersion, and scaled dispersion
#'
#' @rdname HVFInfo
#' @export HVFInfo
#'
HVFInfo <- function(object, ...) {
  UseMethod(generic = 'HVFInfo', object = object)
}

#' Get, set, and manipulate an object's identity classes
#'
#' @param x,object An object
#' @param ... Arguments passed to other methods; for \code{RenameIdents}: named
#' arguments as \code{old.ident = new.ident}; for \code{ReorderIdent}: arguments
#' passed on to \code{\link{FetchData}}
#'
#' @return \code{Idents}: The cell identies
#'
#' @rdname Idents
#' @export Idents
#'
#' @examples
#' # Get cell identity classes
#' Idents(object = pbmc_small)
#'
Idents <- function(object, ... ) {
  UseMethod(generic = 'Idents', object = object)
}

#' @param value The name of the identites to pull from object metadata or the identities themselves
#'
#' @return \code{Idents<-}: An object with the cell identites changed
#'
#' @rdname Idents
#' @export Idents<-
#'
#' @examples
#' # Set cell identity classes
#' # Can be used to set identities for specific cells to a new level
#' Idents(object = pbmc_small, cells = 1:4) <- 'a'
#' head(x = Idents(object = pbmc_small))
#'
#' # Can also set idents from a value in object metadata
#' colnames(x = pbmc_small[[]])
#' Idents(object = pbmc_small) <- 'RNA_snn_res.1'
#' levels(x = pbmc_small)
#'
"Idents<-" <- function(object, ..., value) {
  UseMethod(generic = 'Idents<-', object = object)
}

#' Is an object global/persistent?
#'
#' Typically, when removing \code{Assay} objects from an \code{Seurat} object,
#' all associated objects (eg. \code{DimReduc}, \code{Graph}, and
#' \code{SeuratCommand} objects)
#' are removed as well. If an associated object is marked as global/persistent,
#' the associated object will remain even if its original assay was deleted
#'
#' @param object An object
#' @param ... Arguments passed to other methods
#'
#' @return \code{TRUE} if the object is global/persistent otherwise \code{FALSE}
#'
#' @rdname IsGlobal
#' @export IsGlobal
#'
#' @examples
#' IsGlobal(pbmc_small[['pca']])
#'
IsGlobal <- function(object, ...) {
  UseMethod(generic = 'IsGlobal', object = object)
}

#' Get and set JackStraw information
#'
#' @param object An object
#' @param ... Arguments passed to other methods
#'
#' @rdname JS
#' @export JS
#'
JS <- function(object, ...) {
  UseMethod(generic = 'JS', object = object)
}

#' @param value JackStraw information
#'
#' @rdname JS
#' @export JS<-
#'
"JS<-" <- function(object, ..., value) {
  UseMethod(generic = 'JS<-', object = object)
}

#' Get and set object keys
#'
#' @param object An object
#' @param ... Arguments passed to other methods
#'
#' @rdname Key
#' @export Key
#'
Key <- function(object, ...) {
  UseMethod(generic = 'Key', object = object)
}

#' @param value Key value
#'
#' @rdname Key
#' @export Key<-
#'
"Key<-" <- function(object, ..., value) {
  UseMethod(generic = 'Key<-', object = object)
}

#' Get and set feature loadings
#'
#' @param object An object
#' @param ... Arguments passed to other methods
#'
#' @rdname Loadings
#' @export Loadings
#'
Loadings <- function(object, ...) {
  UseMethod(generic = 'Loadings', object = object)
}

#' @param value Feature loadings to add
#'
#' @rdname Loadings
#' @export Loadings<-
#'
"Loadings<-" <- function(object, ..., value) {
  UseMethod(generic = 'Loadings<-', object = object)
}

#' Get and set miscellaneous data
#'
#' @param object An object
#' @param ... Arguments passed to other methods
#'
#' @return Miscellaneous data
#'
#' @rdname Misc
#' @export Misc
#'
Misc <- function(object, ...) {
  UseMethod(generic = 'Misc', object = object)
}

#' @param value Data to add
#'
#' @return An object with miscellaneous data added
#'
#' @rdname Misc
#' @export Misc<-
#'
"Misc<-" <- function(object, ..., value) {
  UseMethod(generic = 'Misc<-', object = object)
}

#' Get and set project information
#'
#' @param object An object
#' @param ... Arguments passed to other methods
#'
#' @return Project information
#'
#' @rdname Project
#' @export Project
#'
Project <- function(object, ...) {
  UseMethod(generic = 'Project', object = object)
}

#' @param value Project information to set
#'
#' @return An object with project information added
#'
#' @rdname Project
#' @export Project<-
#'
"Project<-" <- function(object, ..., value) {
  UseMethod(generic = 'Project<-', object = object)
}

#' Get the spot radius from an image
#'
#' @param object An image object
#'
#' @return The radius size
#'
#' @rdname Radius
#' @export Radius
#'
Radius <- function(object) {
  UseMethod(generic = 'Radius', object = object)
}

#' Rename cells
#'
#' Change the cell names in all the different parts of an object. Can be useful
#' before combining multiple objects.
#'
#' @param object An object
#' @param ... Arguments passed to other methods
#'
#' @return An object with new cell names
#'
#' @rdname RenameCells
#' @export RenameCells
#'
RenameCells <- function(object, ...) {
  UseMethod(generic = 'RenameCells', object = object)
}

#' @return \code{RenameIdents}: An object with selected identity classes renamed
#'
#' @rdname Idents
#' @export RenameIdents
#' @aliases RenameIdent
#'
#' @examples
#' # Rename cell identity classes
#' # Can provide an arbitrary amount of idents to rename
#' levels(x = pbmc_small)
#' pbmc_small <- RenameIdents(object = pbmc_small, '0' = 'A', '2' = 'C')
#' levels(x = pbmc_small)
#'
RenameIdents <- function(object, ...) {
  UseMethod(generic = 'RenameIdents', object = object)
}

#' @param var Feature or variable to order on
#'
#' @return \code{ReorderIdent}: An object with
#'
#' @rdname Idents
#' @export ReorderIdent
#' @aliases ReorderIdent
#'
#' @examples
#' \dontrun{
#' head(x = Idents(object = pbmc_small))
#' pbmc_small <- ReorderIdent(object = pbmc_small, var = 'PC_1')
#' head(x = Idents(object = pbmc_small))
#' }
#'
ReorderIdent <- function(object, var, ...) {
  UseMethod(generic = 'ReorderIdent', object = object)
}

#' Get image scale factors
#'
#' @param object An object to get scale factors from
#' @param ... Arguments passed to other methods
#'
#' @return An object of class \code{scalefactors}
#'
#' @rdname ScaleFactors
#' @export ScaleFactors
#'
ScaleFactors <- function(object, ...) {
  UseMethod(generic = 'ScaleFactors', object = object)
}

#' Setter for multimodal data
#'
#' @param object An object
#' @param ... Arguments passed to other methods
#'
#' @return object with the assay data set
#'
#' @rdname SetAssayData
#' @export SetAssayData
#'
SetAssayData <- function(object, ...) {
  UseMethod(generic = 'SetAssayData', object = object)
}

#' @return \code{SetIdent}: An object with new identity classes set
#'
#' @rdname Idents
#' @export SetIdent
#'
#' @examples
#' # Set cell identity classes using SetIdent
#' cells.use <- WhichCells(object = pbmc_small, idents = '1')
#' pbmc_small <- SetIdent(object = pbmc_small, cells = cells.use, value = 'B')
#'
SetIdent <- function(object, ...) {
  UseMethod(generic = 'SetIdent', object = object)
}

#' Get spatially variable feature information
#'
#' @rdname SpatiallyVariableFeatures
#' @export SpatiallyVariableFeatures
#'
SpatiallyVariableFeatures <- function(object, ...){
  UseMethod(generic = 'SpatiallyVariableFeatures', object = object)
}

#' @return \code{StashIdent}: An object with the identities stashed
#'
#' @rdname Idents
#' @export StashIdent
#'
#' @examples
#' head(x = pbmc_small[[]])
#' pbmc_small <- StashIdent(object = pbmc_small, save.name = 'idents')
#' head(x = pbmc_small[[]])
#'
StashIdent <- function(object, save.name, ...) {
  UseMethod(generic = 'StashIdent', object = object)
}

#' Get the standard deviations for an object
#'
#' @param object An object
#' @param ... Arguments passed to other methods
#'
#' @rdname Stdev
#' @export Stdev
#'
Stdev <- function(object, ...) {
  UseMethod(generic = 'Stdev', object = object)
}

#' Get spatially variable feature information
#'
#' @param object An object
#' @param ... Arguments passed to other methods
#'
#' @rdname SVFInfo
#' @export SVFInfo
#'
SVFInfo <- function(object, ...) {
  UseMethod(generic = 'SVFInfo', object = object)
}

#' Get and set additional tool data
#'
#' Use \code{Tool} to get tool data. If no additional arguments are provided,
#' will return a vector with the names of tools in the object.
#'
#' @param object An object
#' @param ... Arguments passed to other methods
#'
#' @return If no additional arguments, returns the names of the tools in the
#' object; otherwise returns the data placed by the tool requested
#'
#'@note For developers: set tool data using \code{Tool<-}. \code{Tool<-} will
#'automatically set the name of the tool to the function that called \code{Tool<-},
#'so each function gets one entry in the tools list and cannot overwrite another
#'function's entry. The automatic naming will also remove any method identifiers
#'(eg. RunPCA.Seurat will become RunPCA); please plan accordingly.
#'
#' @rdname Tool
#' @export Tool
#' @aliases Tools
#'
Tool <- function(object, ...) {
  UseMethod(generic = 'Tool', object = object)
}

#' @param value Information to be added to tool list
#'
#' @rdname Tool
#' @export Tool<-
#'
"Tool<-" <- function(object, ..., value) {
  UseMethod(generic = 'Tool<-', object = object)
}

#' Get and set variable feature information
#'
#' @param object An object
#' @param selection.method Method used to set variable features
#' @param ... Arguments passed to other methods
#'
#' @rdname VariableFeatures
#' @export VariableFeatures
#'
VariableFeatures <- function(object, ...) {
  UseMethod(generic = 'VariableFeatures', object = object)
}

#' @param value A character vector of variable features
#'
#' @rdname VariableFeatures
#' @export VariableFeatures<-
#'
"VariableFeatures<-" <- function(object, ..., value) {
  UseMethod(generic = 'VariableFeatures<-', object = object)
}

#' Identify cells matching certain criteria
#'
#' Returns a list of cells that match a particular set of criteria such as
#' identity class, high/low values for particular PCs, ect..
#'
#' @param object An object
#' @param ... Arguments passed to other methods
#'
#' @return A vector of cell names
#'
#' @seealso \code{\link{FetchData}}
#' @rdname WhichCells
#' @export WhichCells
#'
#' @examples
#' WhichCells(object = pbmc_small, idents = 2)
#' WhichCells(object = pbmc_small, expression = MS4A1 > 3)
#' levels(x = pbmc_small)
#' WhichCells(object = pbmc_small, idents = c(1, 2), invert = TRUE)
#'
WhichCells <- function(object, ...) {
  UseMethod(generic = 'WhichCells', object = object)
}