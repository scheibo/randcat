#!/usr/bin/env ruby

require 'uri'
require 'set'
require 'open-uri'

(1..1000).each do |page|
  s = Set.new(URI.extract(open("https://pixabay.com/images/search/cat/?pagi=#{page}", &:read)).map {|s|
    u = URI(s)
    u.path
  }).filter {|path| 
    path && path.start_with?('/photo') && path.end_with?('480.jpg');
  }.map {|path|
    "https://cdn.pixabay.com#{path}"
  }
  s.each do |url|
    puts url
  end
end
