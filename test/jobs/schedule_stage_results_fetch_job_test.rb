# frozen_string_literal: true

require 'test_helper'

class ScheduleStageResultsFetchJobTest < ActiveJob::TestCase
  test 'perform queues stage results fetch job if stage does not have results' do
    StageResultsFetchJob.expects(:perform_later).with(stages(:tdf_2019_4).id)
    StageResultsFetchJob.expects(:perform_later).with(stages(:tdf_2019_5).id)
    StageResultsFetchJob.expects(:perform_later).with(stages(:tdf_2020_3).id)

    ScheduleStageResultsFetchJob.perform_now
  end

  test 'perform queues nothing if all stages have results' do
    stages_without_results.each do |stage|
      stage.stage_results.build(
        player: players(:jim_hopper),
        overall_rank: 100,
        points: 1,
      )
      stage.results_downloaded_at = Time.now.utc
      stage.save!
    end
    StageResultsFetchJob.expects(:perform_later).never

    ScheduleStageResultsFetchJob.perform_now
  end

  test 'peform does not queue results jobs for stages that have not yet taken place' do
    stage = stages(:tdf_2019_5).dup
    stage.date = '2020-02-28'
    stage.number += 1
    stage.save!

    stages(:tdf_2019_4).update!(results_downloaded_at: Time.now.utc)
    stages(:tdf_2019_5).update!(results_downloaded_at: Time.now.utc)
    stages(:tdf_2020_3).update!(results_downloaded_at: Time.now.utc)

    travel_to(Time.zone.local(2020, 2, 28, 10, 59, 59).utc) do
      StageResultsFetchJob.expects(:perform_later).never

      ScheduleStageResultsFetchJob.perform_now
    end

    travel_to(Time.zone.local(2020, 2, 28, 11, 0, 0).utc) do
      StageResultsFetchJob.expects(:perform_later).with(stage.id)

      ScheduleStageResultsFetchJob.perform_now
    end
  end

  private

  def stages_without_results
    @stages_without_results ||= Stage.need_results
  end
end
