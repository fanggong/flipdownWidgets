#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
flipdownWidgets <- function(to,
                            theme = c("dark", "light"),
                            headings = c("Days", "Hours", "Minutes", "Seconds"),
                            base_unit = NULL,
                            ...,
                            width = NULL, height = NULL, elementId = NULL) {
  to <- as.numeric(as.POSIXct(to, ...))

  theme <- match.arg(theme)

  stopifnot(
    "headings must have length = 4" = length(headings) == 4,
    "headings must be type character" = inherits(headings, "character")
  )

  if (!is.null(base_unit)) {
    stopifnot("base_unit must greater than 0" = base_unit > 0)
  }

  parameters = list(
    to = to,
    theme = theme,
    headings = headings,
    base_unit = base_unit
  )

  htmlwidgets::createWidget(
    name = 'flipdownWidgets',
    parameters,
    width = width,
    height = height,
    sizingPolicy = htmlwidgets::sizingPolicy(
      defaultWidth = "100%"
    ),
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
