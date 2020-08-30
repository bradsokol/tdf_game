class Tour2020Participants1 < ActiveRecord::Migration[6.0]
  def change
    names = [
      'Brad Sokol',
      'Bill Mackenzie',
      'Brian Power',
      'Eli Lee',
      'Peter Zoras',
    ]

    names.each do |name|
      player = Player.find_or_create_by!(name: name)
      player.registrations.create(year: 2020)
    end
  end
end
