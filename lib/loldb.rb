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

$:.unshift(File.dirname(__FILE__))

Dotenv.load

module DataDragon
end

module Models
end

require 'error_reporting'
require 'build'
require 'build/haml_context'
require 'build/icons'
require 'build/html'
require 'data_dragon/client'
require 'data_dragon/downloader'
require 'data_dragon/data'
require 'data_dragon/items'
require 'models/list'
require 'models/model'
require 'models/item'
require 'models/items'
require 'seeder'