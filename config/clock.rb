# frozen_string_literal: true

require 'clockwork'

module Clockwork
  if Rails.env.development?
    every(10.seconds, 'Get stage results') {}
  else
    every(15.minutes, 'Get stage results') {}
  end
end
