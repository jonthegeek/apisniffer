.the_list <- function(event, event_names = event$requestId) {
  rlang::set_names(list(event), event_names)
}

.handle_request_event <- function(event) {
  if (event$type == "XHR" || event$type == "Fetch") {
    .env_append(the, "api_request_ids", event$requestId, character())
    .env_append(the, "request_events", .the_list(event))
  }
}

.handle_response_event <- function(event) {
  req_ids <- rlang::env_get(the, "api_request_ids", default = character())
  if (event$requestId %in% req_ids) {
    .env_append(the, "response_events", .the_list(event))
    .log_if_json(event)
  }
}

.log_if_json <- function(event) {
  mime_type <- event$response$mimeType
  request_id <- event$requestId
  if (length(mime_type) && mime_type == "application/json") {
    resp <- the$session$Network$getResponseBody(request_id, wait_ = FALSE)
    .log_json_response_body(the$session$wait_for(resp), request_id)
  }
}

.log_json_response_body <- function(response_body, request_id) {
  .env_append(the, "api_response_bodies", .the_list(response_body, request_id))
  if (length(response_body$body)) {
    resp_json <- jsonlite::parse_json(response_body$body)
    if (length(resp_json)) {
      .env_append(the, "api_response_json", .the_list(resp_json, request_id))
    }
  }
  return(invisible(NULL))
}

.wait_for_responses <- function(start, min_wait, max_wait) {
  while (
    !.waited_min(start, min_wait) ||
    (.unresolved_requests_exist() && !.waited_max(start, max_wait))
  ) {
    later::run_now(0.1)
  }
}

.waited_min <- function(start, min_wait) {
  Sys.time() >= start + min_wait
}

.waited_max <- function(start, max_wait) {
  Sys.time() >= max_wait
}

.unresolved_requests_exist <- function() {
  length(.unresolved_requests()) > 0
}

.unresolved_requests <- function() {
  setdiff(the$api_request_ids, names(the$response_events))
}
