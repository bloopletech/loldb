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

module Models
end

module Seeders
end

module DataDragon
end

require 'error_reporting'
require 'build'
require 'build/haml_context'
require 'build/icons'
require 'build/html'
require 'data_dragon/client'
require 'data_dragon/downloader'
require 'models/source'
require 'models/persistence'
require 'models/list'
require 'models/model'
require 'models/match'
require 'models/vod'
require 'models/league'
require 'models/team'
require 'models/player'
require 'seeders/youtube_link_parser'
require 'seeders/league'
require 'seeders/riot_league'
require 'seeders/riot_streams'
require 'seeders/riot_tournament'
require 'seeders/riot_videos'
require 'seeders/seeder'