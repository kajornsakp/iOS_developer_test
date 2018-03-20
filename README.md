# iOS Developer test
This is a repository for submitting a test as iOS Developer. Selected application = Twitter Search App

[![Build status](https://build.appcenter.ms/v0.1/apps/21156cb0-1e3a-492e-a755-8cebd74f4c65/branches/develop/badge)](https://appcenter.ms)
Powered by AppCenter

# Structure
- VIPER Architecture (first attempt)
- Consists of 3 Modules (Login, Home, Detail)
- Unit tests for each component in module (Not 100%)

# Login Module
- Landing screen for get access token from twitter API (Application-only authentication)

# Home Module
- Provide Search function to Search for user-input keyword (Search API)
- Load More tweets if the user scrolled down to the buttom (15 tweets per page) (Pagination)
- Show brief detail of tweet (status--called by Twitter) such as User profile, user name, tweet test, favorite count, retweet count

# Detail Module
- Provide Same detail as the Tweet Cell in Home Module but focus on each tweet at a time

# CI provided by App Center from Microsoft
- Not included automatic XCTest test because it's required signing to run UITests as well (not enough time)

# Acknowledment
- [Moya](https://github.com/Moya/Moya)
- [PKHUD](https://github.com/pkluz/PKHUD)
- [Kingfisher](https://github.com/onevcat/Kingfisher)
