# frozen_string_literal: true

class Tdf2020Stages < ActiveRecord::Migration[6.0]
  def up
    tour = Tour.find_by!(year: 2020)
    tour.update!(start_date: '2020-08-29', finish_date: '2020-09-20')

    tour.stages.create!(
      number: 1,
      date: '2019-08-29',
      start_town: 'Nice Moyen Pays',
      finish_town: 'Nice',
      distance: 156,
      stage_type: 'flat',
      game_stage: false,
    )
    tour.stages.create!(
      number: 2,
      date: '2019-08-30',
      start_town: 'Nice Haut Pays',
      finish_town: 'Nice',
      distance: 187,
      stage_type: 'mountain',
      game_stage: false,
    )
    tour.stages.create!(
      number: 3,
      date: '2019-08-31',
      start_town: 'Nice',
      finish_town: 'Sisteron',
      distance: 198,
      stage_type: 'flat',
      game_stage: true,
    )
    tour.stages.create!(
      number: 4,
      date: '2019-09-01',
      start_town: 'Sisteron',
      finish_town: 'Orcières-Merlette',
      distance: 157,
      stage_type: 'rolling',
      game_stage: true,
    )
    tour.stages.create!(
      number: 5,
      date: '2019-09-02',
      start_town: 'Gap',
      finish_town: 'Privas',
      distance: 183,
      stage_type: 'flat',
      game_stage: true,
    )
    tour.stages.create!(
      number: 6,
      date: '2019-09-03',
      start_town: 'Le Teil',
      finish_town: 'Mont Aigoual',
      distance: 191,
      stage_type: 'rolling',
      game_stage: true,
    )
    tour.stages.create!(
      number: 7,
      date: '2019-09-04',
      start_town: 'Millau',
      finish_town: 'Lavaur',
      distance: 168,
      stage_type: 'flat',
      game_stage: true,
    )
    tour.stages.create!(
      number: 8,
      date: '2019-09-05',
      start_town: 'Cazères-sur-Garonne',
      finish_town: 'Loudenvielle',
      distance: 140,
      stage_type: 'mountain',
      game_stage: true,
    )
    tour.stages.create!(
      number: 9,
      date: '2019-09-06',
      start_town: 'Pau',
      finish_town: 'Laruns',
      distance: 154,
      stage_type: 'mountain',
      game_stage: true,
    )
    tour.stages.create!(
      number: 10,
      date: '2019-09-08',
      start_town: 'Île d\'Oléron Le Château-d\'Oléron',
      finish_town: 'Île de Ré Saint-Martin-de-Ré',
      distance: 170,
      stage_type: 'flat',
      game_stage: true,
    )
    tour.stages.create!(
      number: 11,
      date: '2019-09-09',
      start_town: 'Châtelaillon-Plage',
      finish_town: 'Poitiers',
      distance: 167,
      stage_type: 'flat',
      game_stage: true,
    )
    tour.stages.create!(
      number: 12,
      date: '2019-09-10',
      start_town: 'Chauvigny',
      finish_town: 'Sarran Corrèze',
      distance: 218,
      stage_type: 'rolling',
      game_stage: true,
    )
    tour.stages.create!(
      number: 13,
      date: '2019-09-11',
      start_town: 'Châtel-Guyon',
      finish_town: 'Puy Mary Cantal',
      distance: 191,
      stage_type: 'mountain',
      game_stage: true,
    )
    tour.stages.create!(
      number: 14,
      date: '2019-09-12',
      start_town: 'Clermont-Ferrand',
      finish_town: 'Lyon',
      distance: 197,
      stage_type: 'flat',
      game_stage: true,
    )
    tour.stages.create!(
      number: 15,
      date: '2019-09-13',
      start_town: 'Lyon',
      finish_town: 'Grand Colombier',
      distance: 175,
      stage_type: 'mountain',
      game_stage: true,
    )
    tour.stages.create!(
      number: 16,
      date: '2019-09-15',
      start_town: 'La Tour-du-Pin',
      finish_town: 'Villard-de-Lans',
      distance: 164,
      stage_type: 'mountain',
      game_stage: true,
    )
    tour.stages.create!(
      number: 17,
      date: '2019-09-16',
      start_town: 'Grenoble',
      finish_town: 'Méribel Col de la Loze',
      distance: 168,
      stage_type: 'mountain',
      game_stage: true,
    )
    tour.stages.create!(
      number: 18,
      date: '2019-09-17',
      start_town: 'Méribel',
      finish_town: 'La Roche-sur-Foron',
      distance: 168,
      stage_type: 'mountain',
      game_stage: true,
    )
    tour.stages.create!(
      number: 19,
      date: '2019-09-18',
      start_town: 'Bourg-en-Bresse',
      finish_town: 'Champagnole',
      distance: 160,
      stage_type: 'flat',
      game_stage: true,
    )
    tour.stages.create!(
      number: 20,
      date: '2019-09-19',
      start_town: 'Lure',
      finish_town: 'La Plance des Belles Filles',
      distance: 36,
      stage_type: 'itt',
      game_stage: true,
    )
    tour.stages.create!(
      number: 21,
      date: '2019-09-20',
      start_town: 'Mantes-la-Jolie',
      finish_town: 'Paris Champs-Élysées',
      distance: 122,
      stage_type: 'flat',
      game_stage: true,
    )
  end

  def down
    Tour.find_by(year: 2020).stages.destroy_all
  end
end
