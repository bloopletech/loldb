require 'cgi'
require 'fileutils'
require 'forwardable'
require 'json'
require 'pathname'
require 'time'
require 'open-uri'
require 'zlib'

require 'rubygems'
require 'rubygems/package'
require 'bundler/setup'
ENV['LOLDB_ENV'] ||= 'development'
Bundler.require(:default, ENV['LOLDB_ENV'])

require 'active_support/core_ext/hash/deep_merge'

$:.unshift(File.dirname(__FILE__))

Dotenv.load

module Models
end

require 'error_reporting'
require 'build'
require 'data_dragon'
require 'data_dragon/client'
require 'data_dragon/downloader'
require 'data_dragon/tail'
require 'data_dragon/items'
require 'models/list'
require 'models/model'
require 'models/item'
require 'models/items'
require 'seeder'
require 'build/haml_context'
require 'build/icons'
require 'build/html'