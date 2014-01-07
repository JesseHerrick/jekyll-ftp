#!/usr/bin/env ruby

# Created by Jesse Herrick
# www.jessegrant.net
# jessegrantherrick@gmail.com

# Gems
require "rubygems"
require "rake"
require "colorize"
require "cucumber"
require "cucumber/rake/task"
require "bundler/gem_tasks"

Cucumber::Rake::Task.new(:default) do |t|
    t.cucumber_opts = "features --format pretty"
end
