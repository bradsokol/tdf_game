class Tour2021Participants1 < ActiveRecord::Migration[6.0]
  def change
    names = [
      'Bill Mackenzie',
      'Brad Sokol',
      'Brian Power',
      'Ed Quan',
      'Eli Lee',
      'Gord Coutts',
      'Keven Fitzpatrick',
      'Kevin Blick',
      'Malcolm Owen',
      'Marc Tohir',
      'Peter Zoras',
      'Roger Partington',
      'Ross Woolford',
      'Shelagh McIvor',
    ]

    names.each do |name|
      player = Player.find_or_create_by!(name: name)
      player.registrations.create(year: 2021)
    end
  end
end
