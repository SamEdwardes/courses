url <- "https://api.github.com/users/jtleek/repos"
url_github_test <- "https://api.github.com/rate_limit"

library(httr)
library(jsonlite)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "be789477e0792e45da93",
                   secret = "c8bdb274c36c30c05f8d67936339e903c94de63b"
)

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET(url, gtoken)
stop_for_status(req)
#content(req)

json1 <- content(req)
json2 <- jsonlite::fromJSON(toJSON(json1))

json2[json2$full_name == "jtleek/datasharing", "created_at" ]
