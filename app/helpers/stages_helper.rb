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
      "#{stage.finish_town} - #{stage.distance} km - #{stage_type_description(stage.stage_type)}"
  end

  def stage_type_description(stage_type)
    {
      'flat' => 'Flat',
      'itt' => 'Time Trial',
      'mountain' => 'Mountain',
      'rolling' => 'Rolling',
      'team_time_trial' => 'Team Time Trial'
    }[stage_type]
  end
end
