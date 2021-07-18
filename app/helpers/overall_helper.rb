# frozen_string_literal: true

module OverallHelper
  def rank_change(result)
    if result.previous_rank.present?
      result.previous_rank - result.overall_rank
    else
      ''
    end
  end

  def subtitle(tour, date)
    if tour.stages.last.date == date
      'Final results'
    else
      "Results up to #{date.strftime('%B %e, %Y')}"
    end
  end
end
