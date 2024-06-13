#' Detect API calls in a web page
#'
#' `r lifecycle::badge("experimental")` Load a page, wait for API calls to
#' complete, and return data about the results.
#'
#' @inheritParams rlang::args_dots_empty
#' @param url The URL to load.
#' @param min_wait The minimum number of seconds to wait for API calls to begin.
#'   The default 8 seconds worked for the 1 page I have tested so far.
#' @param max_wait The maximum number of seconds to wait for API calls to
#'   complete. If there are still calls happening when this time is reached,
#'   they will be stopped and ignored.
#'
#' @return A messy list that will eventually tell you useful information about
#'   API calls.
#' @export
sniff <- function(url, ..., min_wait = 8, max_wait = 60) {
  start <- Sys.time()
  rlang::check_dots_empty()
  .reset_the_env()
  the$session <- .initialize_chromote_session(url)
  .navigate_url(the$session, url)
  .wait_for_responses(start, min_wait, max_wait)
  the$session$close()
  rm("session", envir = the)
  return(invisible(as.list(the)))
}
