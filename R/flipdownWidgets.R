#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
flipdownWidgets <- function(n, width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  parameters = list(
    n = n
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'flipdownWidgets',
    parameters,
    width = width,
    height = height,
    package = 'flipdownWidgets',
    elementId = elementId
  )
}

#' Shiny bindings for flipdownWidgets
#'
#' Output and render functions for using flipdownWidgets within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a flipdownWidgets
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name flipdownWidgets-shiny
#'
#' @export
flipdownWidgetsOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'flipdownWidgets', width, height, package = 'flipdownWidgets')
}

#' @rdname flipdownWidgets-shiny
#' @export
renderFlipdownWidgets <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, flipdownWidgetsOutput, env, quoted = TRUE)
}
