class FixEdQuan2021 < ActiveRecord::Migration[6.0]
  def change
    player = Player.find_or_create_by!(name: 'Edward Quan')
    player.registrations.create(year: 2021)

    player = Player.find_by(name: 'Ed Quan')
    player.registrations.destroy_all
    player.destroy
  end
end
