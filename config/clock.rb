# typed: false
# frozen_string_literal: true

require './config/boot'
require './config/environment'

require 'clockwork'

module Clockwork
  interval = Rails.env.development? ? 10.seconds : 15.minutes

  every(interval, 'Get stage results') { ScheduleStageResultsFetchJob.perform_later }
end
