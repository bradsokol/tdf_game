# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `ScheduleStageResultsFetchJob`.
# Please instead update this file by running `bin/tapioca dsl ScheduleStageResultsFetchJob`.

class ScheduleStageResultsFetchJob
  class << self
    sig do
      params(
        block: T.nilable(T.proc.params(job: ScheduleStageResultsFetchJob).void)
      ).returns(T.any(ScheduleStageResultsFetchJob, FalseClass))
    end
    def perform_later(&block); end

    sig { void }
    def perform_now; end
  end
end
