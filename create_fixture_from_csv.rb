#!/bin/env ruby
#
require "csv"
require "byebug"
require 'yaml'

CSV.foreach("y.csv", headers: true) do |row|
  puts row.to_yaml
end

