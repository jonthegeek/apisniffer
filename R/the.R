# Use a package environment named "the" per the r-lib/tidyverse standard, as
# seen for example in httr2:
# https://github.com/r-lib/httr2/blob/main/R/httr2-package.R#L12
the <- new_environment()

.reset_the_env <- function() {
  the$api_request_ids <- character()
  the$request_events <- list()
  the$response_events <- list()
  the$api_response_bodies <- list()
  the$api_response_json <- list()
  the$session <- NULL
}

.env_append <- function(.env, .name, .value, default = NULL) {
  current_value <- rlang::env_get(.env, .name, default = default)
  .env[[.name]] <- append(current_value, .value)
}
