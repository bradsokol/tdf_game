# typed: true
# frozen_string_literal: true

module StagesHelper
  extend T::Sig

  sig { params(date: Date).returns(String) }
  def format_date(date)
    date.strftime('%B %e')
  end

  sig { params(stages: T::Array[Stage]).returns(T::Array[[String, T.nilable(Integer)]]) }
  def options_from_stages(stages)
    stages.map { |stage| [stage_description(stage), stage.number] }
  end

  sig { params(stage: Stage).returns(String) }
  def stage_description(stage)
    "Stage #{stage.number} - #{format_date(T.must(stage.date))} - #{stage.start_town} to " \
      "#{stage.finish_town} - #{stage.distance} km - #{stage_type_description(T.must(stage.stage_type))}"
  end

  sig { params(stage_type: String).returns(String) }
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
