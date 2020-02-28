# frozen_string_literal: true

require './config/boot'
require './config/environment'

require 'clockwork'

module Clockwork
  if Rails.env.development?
    every(10.seconds, 'Get stage results') { ScheduleStageResultsFetchJob.perform_later }
  else
    every(15.minutes, 'Get stage results') { ScheduleStageResultsFetchJob.perform_later }
  end
end
