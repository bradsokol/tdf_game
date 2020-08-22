# frozen_string_literal: true

class TeamsController < ApplicationController
  def default
    redirect_to_default
  end

  def index
    @tour = Tour.find_by(year: @year)
    @player = Player.find_by(id: params[:player])

    if @tour.nil? || @player.nil?
      redirect_to_default
      return
    end

    @overall_results = @tour.overall_results.find_by(player_id: params[:player])
    @players = Registration.where(year: @year).map(&:player).sort { |a, b| a.name <=> b.name }
    @stages = @tour.stages.select(&:game_stage?)
  end

  private

  def redirect_to_default
    tour = most_recent_tour_with_results
    player = Registration.where(year: tour.year).joins(:player).order(:name).first.player
    redirect_to action: 'index', year: tour.year, player: player.id
  end
end
