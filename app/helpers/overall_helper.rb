# frozen_string_literal: true

module OverallHelper
  def rank_change(result)
    if result.previous_rank.present?
      result.previous_rank - result.overall_rank
    else
      ''
    end
  end
end
