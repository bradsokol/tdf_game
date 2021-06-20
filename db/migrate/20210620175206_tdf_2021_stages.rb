# frozen_string_literal: true

class Tdf2021Stages < ActiveRecord::Migration[6.0]
  def up
    tour = Tour.new(year: 2021, start_date: '2021-06-26', finish_date: '2021-07-18')
    tour.save!

    tour.stages.create!(
      number: 1,
      date: '2021-06-26',
      start_town: 'Brest',
      finish_town: 'Landerneau',
      distance: 198,
      stage_type: 'rolling',
      game_stage: false,
    )
    tour.stages.create!(
      number: 2,
      date: '2021-06-27',
      start_town: 'Perros-Guirec',
      finish_town: 'Mûr-de-Bretagne Guerlédan',
      distance: 184,
      stage_type: 'rolling',
      game_stage: false,
    )
    tour.stages.create!(
      number: 3,
      date: '2021-06-28',
      start_town: 'Lorient',
      finish_town: 'Pontivy',
      distance: 183,
      stage_type: 'flat',
      game_stage: true,
    )
    tour.stages.create!(
      number: 4,
      date: '2021-06-29',
      start_town: 'Redon',
      finish_town: 'Fougères',
      distance: 150,
      stage_type: 'flat',
      game_stage: true,
    )
    tour.stages.create!(
      number: 5,
      date: '2021-06-30',
      start_town: 'Changé',
      finish_town: 'Laval Espace Mayenne',
      distance: 27,
      stage_type: 'itt',
      game_stage: true,
    )
    tour.stages.create!(
      number: 6,
      date: '2021-07-01',
      start_town: 'Tours',
      finish_town: 'Châteauroux',
      distance: 161,
      stage_type: 'flat',
      game_stage: true,
    )
    tour.stages.create!(
      number: 7,
      date: '2021-07-02',
      start_town: 'Vierzon',
      finish_town: 'Le Creusot',
      distance: 249,
      stage_type: 'rolling',
      game_stage: true,
    )
    tour.stages.create!(
      number: 8,
      date: '2021-07-03',
      start_town: 'Oyonnax',
      finish_town: 'Le Grand-Bornand',
      distance: 151,
      stage_type: 'mountain',
      game_stage: true,
    )
    tour.stages.create!(
      number: 9,
      date: '2021-07-04',
      start_town: 'Cluses',
      finish_town: 'Tignes',
      distance: 145,
      stage_type: 'mountain',
      game_stage: true,
    )
    tour.stages.create!(
      number: 10,
      date: '2021-07-06',
      start_town: 'Albertville',
      finish_town: 'Valence',
      distance: 191,
      stage_type: 'flat',
      game_stage: true,
    )
    tour.stages.create!(
      number: 11,
      date: '2021-07-07',
      start_town: 'Sorgues',
      finish_town: 'Malaucène',
      distance: 199,
      stage_type: 'mountain',
      game_stage: true,
    )
    tour.stages.create!(
      number: 12,
      date: '2021-07-08',
      start_town: 'Saint-Paul-Trois-Châteaux',
      finish_town: 'Nîmes',
      distance: 159,
      stage_type: 'flat',
      game_stage: true,
    )
    tour.stages.create!(
      number: 13,
      date: '2021-07-09',
      start_town: 'Nîmes',
      finish_town: 'Carcassonne',
      distance: 220,
      stage_type: 'flat',
      game_stage: true,
    )
    tour.stages.create!(
      number: 14,
      date: '2021-07-10',
      start_town: 'Carcassonne',
      finish_town: 'Quillan',
      distance: 184,
      stage_type: 'rolling',
      game_stage: true,
    )
    tour.stages.create!(
      number: 15,
      date: '2021-07-11',
      start_town: 'Céret',
      finish_town: 'Andorre-la-Vieille',
      distance: 191,
      stage_type: 'mountain',
      game_stage: true,
    )
    tour.stages.create!(
      number: 16,
      date: '2021-07-13',
      start_town: 'Pas de la Case',
      finish_town: 'Saint-Gaudens',
      distance: 169,
      stage_type: 'rolling',
      game_stage: true,
    )
    tour.stages.create!(
      number: 17,
      date: '2021-07-14',
      start_town: 'Muret',
      finish_town: 'Saint-Lary-Soulan Col du Portet',
      distance: 178,
      stage_type: 'mountain',
      game_stage: true,
    )
    tour.stages.create!(
      number: 18,
      date: '2021-07-15',
      start_town: 'Pau',
      finish_town: 'Luz Ardiden',
      distance: 130,
      stage_type: 'mountain',
      game_stage: true,
    )
    tour.stages.create!(
      number: 19,
      date: '2021-07-16',
      start_town: 'Mourenx',
      finish_town: 'Libourne',
      distance: 207,
      stage_type: 'flat',
      game_stage: true,
    )
    tour.stages.create!(
      number: 20,
      date: '2021-07-17',
      start_town: 'Libourne',
      finish_town: 'Saint-Emilion',
      distance: 31,
      stage_type: 'itt',
      game_stage: true,
    )
    tour.stages.create!(
      number: 21,
      date: '2021-07-18',
      start_town: 'Chatou',
      finish_town: 'Paris Champs-Élysées',
      distance: 108,
      stage_type: 'flat',
      game_stage: true,
    )
  end

  def down
    Tour.find_by(year: 2021).stages.destroy_all
  end
end
