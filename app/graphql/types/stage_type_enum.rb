# frozen_string_literal: true

module Types
  class StageTypeEnum < Types::BaseEnum
    value 'FLAT', value: 'flat'
    value 'ITT', value: 'itt'
    value 'MOUNTAIN', value: 'mountain'
    value 'PROLOG', value: 'prolog'
    value 'REST', value: 'rest'
    value 'ROLLING', value: 'rolling'
    value 'TTT', value: 'ttt'
  end
end
