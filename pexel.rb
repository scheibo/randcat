#!/usr/bin/env ruby

require 'uri'
require 'set'
require 'open-uri'

(1..1000).each do |page|
  s = Set.new(URI.extract(open("https://www.pexels.com/search/cat/?page=#{page}", &:read)).map {|s|
    u = URI(s)
    u.path
  }).filter {|path| 
    path && path.start_with?('/photos');
  }.map {|path|
    "https://images.pexels.com#{path}"
  }
  s.each do |url|
    puts url
  end
end
