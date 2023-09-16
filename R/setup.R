

#' hand back ui.UserInterface from sfaira from specified basilisk environment
#' @note sfaira 0.3.12 munged, tensorflow 2.8.0, protobuf 3.20.0
#' @export
sfaira_ui = function(ref) {
 proc = basilisk::basiliskStart(bsklenv, testload="sfaira") # avoid package-specific import
 #on.exit(basilisk::basiliskStop(proc))
 basilisk::basiliskRun(proc, function(ref) {
     ref$ui$UserInterface(sfaira_repo=TRUE)
   }, ref)
}

#' hand sfaira from specified basilisk environment
#' @note sfaira 0.3.12 munged, tensorflow 2.8.0, protobuf 3.20.0
#' @export
sfaira_ref = function() {
 proc = basilisk::basiliskStart(bsklenv, testload="sfaira") # avoid package-specific import
 #on.exit(basilisk::basiliskStop(proc))
 basilisk::basiliskRun(proc, function() {
     reticulate::import("sfaira")
   })
}

#' hand scanpy from specified basilisk environment
#' @note sfaira 0.3.12 munged, tensorflow 2.8.0, protobuf 3.20.0
#' @export
scanpy_ref = function() {
 proc = basilisk::basiliskStart(bsklenv, testload="scanpy") # avoid package-specific import
 #on.exit(basilisk::basiliskStop(proc))
 basilisk::basiliskRun(proc, function() {
     reticulate::import("scanpy")
   })
}
