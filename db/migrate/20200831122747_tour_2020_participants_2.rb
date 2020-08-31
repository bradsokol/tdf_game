class Tour2020Participants2 < ActiveRecord::Migration[6.0]
  def change
    names = [
      'Ancient Lejogger',
      'Bob Labuik',
      'Coco Colombiano',
      'Ed Quan',
      'G. Graveldog',
      'Keven Fitzpatrick',
      'Malcolm Owen',
      'Marc Tohir',
      'Shelagh McIvor',
      'Ricky Bobby',
      'Roger Partington',
      'Ross Woolford',
    ]

    names.each do |name|
      player = Player.find_or_create_by!(name: name)
      player.registrations.create(year: 2020)
    end
  end
end
