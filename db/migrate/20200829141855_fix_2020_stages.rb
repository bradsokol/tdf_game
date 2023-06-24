class Fix2020Stages < ActiveRecord::Migration[6.0]
  def up
    tour = Tour.where(year: 2020).first
    tour&.stages&.each do |stage|
      stage.update!(date: stage.date.next_year)
    end
  end
end
