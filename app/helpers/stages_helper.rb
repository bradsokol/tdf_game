# frozen_string_literal: true

module StagesHelper
  def format_date(date)
    date.strftime('%B %e')
  end

  def options_from_stages(stages)
    stages.map { |stage| [stage_description(stage), stage.number] }
  end

  def stage_description(stage)
    "Stage #{stage.number} - #{format_date(stage.date)} - #{stage.start_town} to " \
      "#{stage.finish_town} - #{stage.distance} km"
  end
end
