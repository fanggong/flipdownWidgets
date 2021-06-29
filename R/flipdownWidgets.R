#' Create an HTML countdown widget using the flipdown.js library
#'
#' This function creates an HTML widgets to display a countdown using the
#' [flipdown.js](https://github.com/feddelegrand7/flipdownr) library.
#'
#' @param to R object to be passed to the [as.POSIXct] function to specifying the target date.
#' @param theme The theme of the widget. Possible value: "dark", "light".
#' @param headings A character vector of length 4 specifying the heading related to each time part.
#' Defaults to c("Days", "Hours", "Minutes", "Seconds").
#' @param width Width of the countdown widget. Must be a valid CSS unit (like \code{'100\%'}, \code{'400px'}, \code{'auto'})
#' or a number, which will be coerced to a string and have \code{'px'} appended.
#' @param height Not being used here. The height of the widget will be automatically sized according to
#' the width of the widget.
#' @param elementId An id for the widget (a random string by default).
#' @param ... all the argument to be passed to [as.POSIXct].
#'
#' @return
#' An HTML countdown widget
#'
#' @examples
#' library(flipdownWidgets)
#' flipdownWidgets(Sys.time() + 100)
#'
#' @import htmlwidgets
#'
#' @export
flipdownWidgets <- function(to, ...,
                            theme = c("dark", "light"),
                            headings = c("Days", "Hours", "Minutes", "Seconds"),
                            width = NULL, height = NULL, elementId = NULL) {
  to <- as.numeric(as.POSIXct(to, ...))

  theme <- match.arg(theme)

  stopifnot(
    "headings must have length = 4" = length(headings) == 4,
    "headings must be type character" = inherits(headings, "character")
  )

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
#' @return
#' \code{flipdownWidgetsOutput} returns a flipdownWidgets output element that can be included in user interface.
#' And \code{renderFlipdownWidgets} returns a function which will generate data for render.
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
