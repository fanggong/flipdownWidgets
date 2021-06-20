#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
flipdownWidgets <- function(count,
                            theme = c("dark", "light"),
                            headings = c("Days", "Hours", "Minutes", "Seconds"),
                            width = NULL, height = NULL, elementId = NULL) {
  theme <- match.arg(theme)
  stopifnot(
    "headings must have length = 4" = length(headings) == 4,
    "headings must be type character" = inherits(headings, "character"),
    "count must have length = 1" = length(count) == 1,
    "count must have type integer or numeric" = inherits(count, c("integer",))
  )

  to <- as.numeric(Sys.time()) + count

  parameters = list(
    to = to,
    theme = theme,
    headings = headings
  )

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
