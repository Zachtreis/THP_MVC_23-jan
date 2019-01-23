require 'bundler'
Bundler.require
$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/controller'
require 'app/gossip'
require 'app/router'
require 'app/view'
require 'views/index'
require 'views/done'
require 'csv'
require 'open-uri'
require 'resolv-replace'
require 'colorize'
Router.new.perform
