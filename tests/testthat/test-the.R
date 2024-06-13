test_that("Can reset the env.", {
  expect_snapshot({
    .reset_the_env()
    as.list(the)
  })
  expect_snapshot({
    the$api_request_ids <- c("a", "b")
    as.list(the)
  })
  expect_snapshot({
    .reset_the_env()
    as.list(the)
  })
})
