.initialize_chromote_session <- function(url) {
  session <- chromote::ChromoteSession$new(auto_events = FALSE)
  session$Network$enable()
  session$callback_cancelers <- list()
  session$callback_cancelers$req <- session$Network$requestWillBeSent(
    callback_ = .handle_request_event
  )
  session$callback_cancelers$resp <- session$Network$responseReceived(
    callback_ = .handle_response_event
  )
  return(session)
}

.navigate_url <- function(session, url) {
  session$Page$enable()
  waiter <- session$Page$loadEventFired(wait_ = FALSE)
  session$Page$navigate(url, wait_ = FALSE)
  session$wait_for(waiter)
  session$Page$disable()
}
