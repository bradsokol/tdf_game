# frozen_string_literal: true

tour_2019 = Tour.create!(year: 2019, start_date: '2019-07-06', finish_date: '2019-07-28')
Tour.create!(year: 2020, start_date: '2020-06-27', finish_date: '2020-07-19')

tour_2019.stages.create!(
  number: 1,
  date: '2019-07-06',
  start_town: 'Bruxelles',
  start_country: 'Belgium',
  finish_town: 'Brussel',
  finish_country: 'Belgium',
  distance: 195,
  stage_type: 'flat',
  game_stage: false,
)
tour_2019.stages.create!(
  number: 2,
  date: '2019-07-07',
  start_town: 'Bruxelles Palais Royal',
  start_country: 'Belgium',
  finish_town: 'Brussel Atomium',
  finish_country: 'Belgium',
  distance: 28,
  stage_type: 'ttt',
  game_stage: false,
)
tour_2019.stages.create!(
  number: 3,
  date: '2019-07-08',
  start_town: 'Binche',
  start_country: 'Belgium',
  finish_town: 'Épernay',
  distance: 215,
  stage_type: 'rolling',
  game_stage: true,
)
tour_2019.stages.create!(
  number: 4,
  date: '2019-07-09',
  start_town: 'Reims',
  finish_town: 'Nancy',
  distance: 214,
  stage_type: 'flat',
  game_stage: true,
)
tour_2019.stages.create!(
  number: 5,
  date: '2019-07-10',
  start_town: 'Saint-Dié-des-Vosges',
  finish_town: 'Colmar',
  distance: 176,
  stage_type: 'rolling',
  game_stage: true,
)
tour_2019.stages.create!(
  number: 6,
  date: '2019-07-11',
  start_town: 'Mulhouse',
  finish_town: 'La Planche des Belles Filles',
  distance: 161,
  stage_type: 'mountain',
  game_stage: true,
)
tour_2019.stages.create!(
  number: 7,
  date: '2019-07-12',
  start_town: 'Belfort',
  finish_town: 'Chalon-sur-Saône',
  distance: 230,
  stage_type: 'flat',
  game_stage: true,
)
tour_2019.stages.create!(
  number: 8,
  date: '2019-07-13',
  start_town: 'Mâcon',
  finish_town: 'Saint-Étienne',
  distance: 200,
  stage_type: 'rolling',
  game_stage: true,
)
tour_2019.stages.create!(
  number: 9,
  date: '2019-07-14',
  start_town: 'Saint-Étienne',
  finish_town: 'Brioude',
  distance: 171,
  stage_type: 'rolling',
  game_stage: true,
)
tour_2019.stages.create!(
  number: 10,
  date: '2019-07-15',
  start_town: 'Saint-Flour',
  finish_town: 'Albi',
  distance: 218,
  stage_type: 'flat',
  game_stage: true,
)
tour_2019.stages.create!(
  number: 11,
  date: '2019-07-17',
  start_town: 'Albi',
  finish_town: 'Toulouse',
  distance: 167,
  stage_type: 'flat',
  game_stage: true,
)
tour_2019.stages.create!(
  number: 12,
  date: '2019-07-18',
  start_town: 'Toulouse',
  finish_town: 'Bagnères-de-Bigorre',
  distance: 210,
  stage_type: 'mountain',
  game_stage: true,
)
tour_2019.stages.create!(
  number: 13,
  date: '2019-07-19',
  start_town: 'Pau',
  finish_town: 'Pau',
  distance: 27,
  stage_type: 'itt',
  game_stage: true,
)
tour_2019.stages.create!(
  number: 14,
  date: '2019-07-20',
  start_town: 'Tarbes',
  finish_town: 'Tourmalet Barèges',
  distance: 111,
  stage_type: 'mountain',
  game_stage: true,
)
tour_2019.stages.create!(
  number: 15,
  date: '2019-07-21',
  start_town: 'Limoux',
  finish_town: 'Foix Prat d\'Albis',
  distance: 185,
  stage_type: 'mountain',
  game_stage: true,
)
tour_2019.stages.create!(
  number: 16,
  date: '2019-07-23',
  start_town: 'Nîmes',
  finish_town: 'Nîmes',
  distance: 177,
  stage_type: 'flat',
  game_stage: true,
)
tour_2019.stages.create!(
  number: 17,
  date: '2019-07-24',
  start_town: 'Pont du Gard',
  finish_town: 'Gap',
  distance: 200,
  stage_type: 'rolling',
  game_stage: true,
)
tour_2019.stages.create!(
  number: 18,
  date: '2019-07-25',
  start_town: 'Embrun',
  finish_town: 'Valloire',
  distance: 208,
  stage_type: 'mountain',
  game_stage: true,
)
tour_2019.stages.create!(
  number: 19,
  date: '2019-07-26',
  start_town: 'Saint-Jean-de-Maurienn',
  finish_town: 'Tignes',
  distance: 127,
  stage_type: 'mountain',
  game_stage: true,
)
tour_2019.stages.create!(
  number: 20,
  date: '2019-07-27',
  start_town: 'Albertville',
  finish_town: 'Val Thorens',
  distance: 130,
  stage_type: 'mountain',
  game_stage: true,
)
tour_2019.stages.create!(
  number: 21,
  date: '2019-07-28',
  start_town: 'Rambouillet',
  finish_town: 'Paris Champs-Élysées',
  distance: 128,
  stage_type: 'flat',
  game_stage: true,
)

Player.create!(name: 'Brad Sokol')
Player.create!(name: 'Roger Partington')
Player.create!(name: 'Brian Power')
Player.create!(name: 'Bob LaBuik')
Player.create!(name: 'Bill Mackenzie')
Player.create!(name: 'Keven Fitzpatrick')
Player.create!(name: 'Gord Coutts')
Player.create!(name: 'Peter Zoras')
Player.create!(name: 'Eli Lee')
Player.create!(name: 'Ross Woolford')
Player.create!(name: 'Malcolm Owen')
Player.create!(name: 'G. Graveldog')
Player.create!(name: 'Coco Colombiano')
Player.create!(name: 'Kevin Blick')
Player.create!(name: 'Shelagh McIvor')
Player.create!(name: 'Brent Swanick')
Player.create!(name: 'Marc Tohir')
Player.all.each { |player| player.registrations.create!(year: 2019) }
