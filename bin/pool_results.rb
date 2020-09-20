#! /usr/bin/env ruby

# frozen_string_literal: true

require 'net/http'

time = Time.now
output = if time.wday != 1 && time.hour >= 11 && time.hour < 14
           params = { year: time.year, month: time.month, day: time.day }
           uri = URI(format('https://ifarm.nl/tdf/%<year>04d%<month>02d%<day>02d.html', params))
           response = Net::HTTP.get_response(uri)

           if response.is_a?(Net::HTTPSuccess) && response.body.include?("September #{time.day}")
             <<~OUTPUT
               \e[33mResults!
               ---
               Results|href=#{uri}
             OUTPUT
           end
         end

puts output || 'No results'
