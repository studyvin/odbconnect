DBItest::make_context(odbconnect(), list(dsn = "PostgreSQL"), tweaks = DBItest::tweaks(), name = "odbconnect")
DBItest::test_all(c(
  "package_name",
  "quote_identifier_not_vectorized",
  "invalid_query",
  "command_query",
  "fetch_no_return_value", # dbClearResult not supported yet
  #"data_type_connection", # dbDataType not supported yet
  "data_logical_int.*", # logicals are R logicals, not ints
  "data_numeric.*", # Numeric types with high precision are converted to strings
  "data_64_bit.*", # Numeric types with high precision are converted to strings
  "data_timestamp_.*",
  "data_time.*", # time data not supported currently
  "data_date.*", # date data has class in entire row rather than for each item.
  "bind_raw.*",
  "bind.*named_colon",
  "bind_.*named_dollar",
  "rows_affected", # this won't work until writeTable is working
  "fetch_premature_close", # these won't work until fetch() can handle the n argument.
  "stale_result_warning", # Warnings for more than one result, not sure why we
  # want this actually, there is no technical reason to have only one active result per
  # connection.
  "is_valid_result", # turning this off temporarily
  NULL
))
