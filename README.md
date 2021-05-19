# insta-crawler
A simple ruby script to download photos, videos and posts

[![forthebadge](https://forthebadge.com/images/badges/made-with-ruby.svg)](https://forthebadge.com)

# Installation
```
git clone https://github.com/krishpranav/insta-crawler
cd insta-crawler
bundle install
```

# Setting environment variable
```
export sessionid=[your instagram sessionid]
```

# Help Menu
```
Usage:
  instagram-crawler [options]
  See https://github.com/krishpranav/insta-crawler for more information.

options:
    -u, --username USERNAME          Instagram username
    -d, --download                   Download files
    -a, --after DATE                 Download files after this date (YYYYMMDD)
    -b, --before DATE                Download files before this date (YYYYMMDD)
    -l, --log                        Generate a log file in the current directory
    -P, --proxyname PROXYNAME        Specify proxyname of your proxy server
    -p, --port PORT                  Specify port of your proxy server (default port: 8080)
    -v, --version                    Show the instagram-crawler version
    -h, --help                       Show this message
```
