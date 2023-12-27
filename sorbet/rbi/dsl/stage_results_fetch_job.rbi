# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `StageResultsFetchJob`.
# Please instead update this file by running `bin/tapioca dsl StageResultsFetchJob`.

class StageResultsFetchJob
  class << self
    sig do
      params(
        stage_id: T.untyped,
        block: T.nilable(T.proc.params(job: StageResultsFetchJob).void)
      ).returns(T.any(StageResultsFetchJob, FalseClass))
    end
    def perform_later(stage_id, &block); end

    sig { params(stage_id: T.untyped).returns(T.untyped) }
    def perform_now(stage_id); end
  end
end
