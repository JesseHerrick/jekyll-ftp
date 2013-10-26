#!/usr/bin/env ruby

$: << File.expand_path(File.dirname(__FILE__) + "/../lib")

# Lib Files
require 'jekyll-ftp/version'

# Gems
require "rubygems"
require "rake"
require "colorize"

# Tasks
desc "Get version"
task :version do
    puts "Jekyll-FTP".blue + " v#{Jekyll_FTP::VERSION}".yellow
end

desc "Default task."
task :default do
    `rake version`
    puts "Gem seems to be in tip top shape!".green
    puts "Run: ".yellow + "`jekyll-ftp --help` to list all commands."
end

desc "Build gem."
task :build do
    puts "Starting gem build...".yellow
    puts "          Building...".yellow
    `gem build jekyll-ftp.gemspec`

    version = Jekyll_FTP::VERSION
    puts "Jekyll-FTP successfully built! ".green + "Gem ".blue + "v" + version
    puts puts "Gems in this directory: ".yellow + `ls *.gem`
end