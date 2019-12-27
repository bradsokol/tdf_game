# frozen_string_literal: true

module Api
  class ThingsController < ApplicationController
    def index
      render json: { things: [
        {
          name: 'some-thing',
          guid: '7216a073-d51b-496f-8365-be7cc2a05a4e'
        },
        {
          name: 'another-thing',
          guid: '23fe9feb-c206-4154-9661-cd98d25bdae7'
        }
      ] }.to_json
    end
  end
end
