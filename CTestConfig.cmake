set(CTEST_PROJECT_NAME "insight")
set(CTEST_DROP_METHOD "https")
set(CTEST_DROP_SITE "cdash.orexplore.se")
set(CTEST_DROP_LOCATION "/submit.php?project=insight")
set(CTEST_CURL_OPTIONS CURLOPT_SSL_VERIFYPEER_OFF CURLOPT_SSL_VERIFYHOST_OFF)
set(CTEST_DROP_SITE_CDASH TRUE)
