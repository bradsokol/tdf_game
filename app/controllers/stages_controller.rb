# frozen_string_literal: true

class StagesController < ApplicationController
  def default
    redirect_to_default
  end

  def index
    tour = Tour.find_by(year: @year)
    @stage = tour.stages.find_by(number: params[:stage]) if tour.present?

    if tour.nil?
      redirect_to_default
      return
    end

    if @stage.nil?
      @stage = first_game_stage(tour)
      redirect_to action: 'index', year: tour.year, stage: @stage.number
      return
    end

    if @stage.game_stage?
      @stage_results = @stage.stage_results.order(points: :desc)
      @winner_points = @stage_results.first.points if @stage_results.present?
    end
    @stages = tour.stages.order(:number).select(&:game_stage?)
  end

  private

  def first_game_stage(tour)
    tour.stages.order(:number).select(&:game_stage?).first
  end

  def redirect_to_default
    tour = Tour.all.order(:year).last
    stage = first_game_stage(tour)
    redirect_to action: 'index', year: tour.year, stage: stage.number
  end
end
