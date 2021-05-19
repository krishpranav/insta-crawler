$LOAD_PATH << File.dirname(__FILE__)

require "optparse"
require "http"
require "nokogiri"
require "logger"
require "colorize"

require "insta_crawler/version"

require "insta_crawler/main"
require "insta_crawler/file"
require "insta_crawler/logger"
require "insta_crawler/multi_io"
require "insta_crawler/config"


require "insta_crawler/parser/args"
require "insta_crawler/parser/base"
require "insta_crawler/parser/html"
require "insta_crawler/parser/json"


require "insta_crawler/errors/http_error"
require "insta_crawler/errors/env_error"
require "insta_crawler/errors/arg_error"
