# frozen_string_literal: true

class TeamsController < ApplicationController
  def default
    redirect_to_default
  end

  def index
    @tour = Tour.find_by(year: @year)
    @player = Player.find_by(id: params[:player])

    if @tour.nil?
      redirect_to_default
      return
    end

    @player = first_player(@tour) if @player.nil?

    @overall_results = @tour.overall_results.find_by(player_id: @player.id) if @player
    @players = Registration.where(year: @year).map(&:player).sort_by(&:name)
    @stages = @tour.stages.select(&:game_stage?)
  end

  private

  def first_player(tour)
    Registration.where(year: tour.year).joins(:player).order(:name).first&.player
  end

  def redirect_to_default
    tour = Tour.order(:year).last
    player = first_player(tour)
    if player
      redirect_to action: 'index', year: tour.year, player: player.id
    else
      redirect_to action: 'index', year: tour.year
    end
  end
end
