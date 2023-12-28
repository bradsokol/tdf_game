# typed: true
# frozen_string_literal: true

module OverallHelper
  extend T::Sig

  sig { params(result: OverallResult).returns(String) }
  def rank_change(result)
    if result.previous_rank.present? && result.overall_rank.present?
      (T.must(result.previous_rank) - T.must(result.overall_rank)).to_s
    else
      ''
    end
  end

  sig { params(tour: Tour, date: Date).returns(String) }
  def subtitle(tour, date)
    if tour.stages.last.date == date
      'Final results'
    else
      "Results up to #{date.strftime('%B %e, %Y')}"
    end
  end
end
