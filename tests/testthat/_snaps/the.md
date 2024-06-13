# Can reset the env.

    Code
      .reset_the_env()
      as.list(the)
    Output
      $request_events
      list()
      
      $response_events
      list()
      
      $session
      NULL
      
      $api_response_json
      list()
      
      $api_request_ids
      character(0)
      
      $api_response_bodies
      list()
      

---

    Code
      the$api_request_ids <- c("a", "b")
      as.list(the)
    Output
      $request_events
      list()
      
      $response_events
      list()
      
      $session
      NULL
      
      $api_response_json
      list()
      
      $api_request_ids
      [1] "a" "b"
      
      $api_response_bodies
      list()
      

---

    Code
      .reset_the_env()
      as.list(the)
    Output
      $request_events
      list()
      
      $response_events
      list()
      
      $session
      NULL
      
      $api_response_json
      list()
      
      $api_request_ids
      character(0)
      
      $api_response_bodies
      list()
      

