# frozen_string_literal: true

def register_player(name, year)
  player = Player.find_or_create_by!(name:)
  player.registrations.create!(year:)
  player
end

unless Tour.exists?(year: 2019)
  tour_2019 = Tour.create!(year: 2019, start_date: '2019-07-06', finish_date: '2019-07-28')

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

  register_player('Brad Sokol', 2019)
  register_player('Roger Partington', 2019)
  register_player('Brian Power', 2019)
  register_player('Bob LaBuik', 2019)
  register_player('Bill Mackenzie', 2019)
  register_player('Keven Fitzpatrick', 2019)
  register_player('Gord Coutts', 2019)
  register_player('Peter Zoras', 2019)
  register_player('Eli Lee', 2019)
  register_player('Ross Woolford', 2019)
  register_player('Malcolm Owen', 2019)
  register_player('G. Graveldog', 2019)
  register_player('Coco Colombiano', 2019)
  register_player('Kevin Blick', 2019)
  register_player('Shelagh McIvor', 2019)
  register_player('Brent Swanick', 2019)
  register_player('Marc Tohir', 2019)
end

unless Tour.exists?(year: 2020)
  tour = Tour.create!(year: 2020, start_date: '2020-08-29', finish_date: '2020-09-20')

  tour.stages.create!(
    number: 1,
    date: '2020-08-29',
    start_town: 'Nice Moyen Pays',
    finish_town: 'Nice',
    distance: 156,
    stage_type: 'flat',
    game_stage: false,
  )
  tour.stages.create!(
    number: 2,
    date: '2020-08-30',
    start_town: 'Nice Haut Pays',
    finish_town: 'Nice',
    distance: 187,
    stage_type: 'mountain',
    game_stage: false,
  )
  tour.stages.create!(
    number: 3,
    date: '2020-08-31',
    start_town: 'Nice',
    finish_town: 'Sisteron',
    distance: 198,
    stage_type: 'flat',
    game_stage: true,
  )
  tour.stages.create!(
    number: 4,
    date: '2020-09-01',
    start_town: 'Sisteron',
    finish_town: 'Orcières-Merlette',
    distance: 157,
    stage_type: 'rolling',
    game_stage: true,
  )
  tour.stages.create!(
    number: 5,
    date: '2020-09-02',
    start_town: 'Gap',
    finish_town: 'Privas',
    distance: 183,
    stage_type: 'flat',
    game_stage: true,
  )
  tour.stages.create!(
    number: 6,
    date: '2020-09-03',
    start_town: 'Le Teil',
    finish_town: 'Mont Aigoual',
    distance: 191,
    stage_type: 'rolling',
    game_stage: true,
  )
  tour.stages.create!(
    number: 7,
    date: '2020-09-04',
    start_town: 'Millau',
    finish_town: 'Lavaur',
    distance: 168,
    stage_type: 'flat',
    game_stage: true,
  )
  tour.stages.create!(
    number: 8,
    date: '2020-09-05',
    start_town: 'Cazères-sur-Garonne',
    finish_town: 'Loudenvielle',
    distance: 140,
    stage_type: 'mountain',
    game_stage: true,
  )
  tour.stages.create!(
    number: 9,
    date: '2020-09-06',
    start_town: 'Pau',
    finish_town: 'Laruns',
    distance: 154,
    stage_type: 'mountain',
    game_stage: true,
  )
  tour.stages.create!(
    number: 10,
    date: '2020-09-08',
    start_town: 'Île d\'Oléron Le Château-d\'Oléron',
    finish_town: 'Île de Ré Saint-Martin-de-Ré',
    distance: 170,
    stage_type: 'flat',
    game_stage: true,
  )
  tour.stages.create!(
    number: 11,
    date: '2020-09-09',
    start_town: 'Châtelaillon-Plage',
    finish_town: 'Poitiers',
    distance: 167,
    stage_type: 'flat',
    game_stage: true,
  )
  tour.stages.create!(
    number: 12,
    date: '2020-09-10',
    start_town: 'Chauvigny',
    finish_town: 'Sarran Corrèze',
    distance: 218,
    stage_type: 'rolling',
    game_stage: true,
  )
  tour.stages.create!(
    number: 13,
    date: '2020-09-11',
    start_town: 'Châtel-Guyon',
    finish_town: 'Puy Mary Cantal',
    distance: 191,
    stage_type: 'mountain',
    game_stage: true,
  )
  tour.stages.create!(
    number: 14,
    date: '2020-09-12',
    start_town: 'Clermont-Ferrand',
    finish_town: 'Lyon',
    distance: 197,
    stage_type: 'flat',
    game_stage: true,
  )
  tour.stages.create!(
    number: 15,
    date: '2020-09-13',
    start_town: 'Lyon',
    finish_town: 'Grand Colombier',
    distance: 175,
    stage_type: 'mountain',
    game_stage: true,
  )
  tour.stages.create!(
    number: 16,
    date: '2020-09-15',
    start_town: 'La Tour-du-Pin',
    finish_town: 'Villard-de-Lans',
    distance: 164,
    stage_type: 'mountain',
    game_stage: true,
  )
  tour.stages.create!(
    number: 17,
    date: '2020-09-16',
    start_town: 'Grenoble',
    finish_town: 'Méribel Col de la Loze',
    distance: 168,
    stage_type: 'mountain',
    game_stage: true,
  )
  tour.stages.create!(
    number: 18,
    date: '2020-09-17',
    start_town: 'Méribel',
    finish_town: 'La Roche-sur-Foron',
    distance: 168,
    stage_type: 'mountain',
    game_stage: true,
  )
  tour.stages.create!(
    number: 19,
    date: '2020-09-18',
    start_town: 'Bourg-en-Bresse',
    finish_town: 'Champagnole',
    distance: 160,
    stage_type: 'flat',
    game_stage: true,
  )
  tour.stages.create!(
    number: 20,
    date: '2020-09-19',
    start_town: 'Lure',
    finish_town: 'La Plance des Belles Filles',
    distance: 36,
    stage_type: 'itt',
    game_stage: true,
  )
  tour.stages.create!(
    number: 21,
    date: '2020-09-20',
    start_town: 'Mantes-la-Jolie',
    finish_town: 'Paris Champs-Élysées',
    distance: 122,
    stage_type: 'flat',
    game_stage: true,
  )

  register_player('Brad Sokol', 2020)
  register_player('Bill Mackenzie', 2020)
  register_player('Brian Power', 2020)
  register_player('Eli Lee', 2020)
  register_player('Peter Zoras', 2020)
  register_player('Ancient Lejogger', 2020)
  register_player('Bob Labuik', 2020)
  register_player('Coco Colombiano', 2020)
  register_player('Ed Quan', 2020)
  register_player('G. Graveldog', 2020)
  register_player('Keven Fitzpatrick', 2020)
  register_player('Malcolm Owen', 2020)
  register_player('Marc Tohir', 2020)
  register_player('Shelagh McIvor', 2020)
  register_player('Ricky Bobby', 2020)
  register_player('Roger Partington', 2020)
  register_player('Ross Woolford', 2020)
end

unless Tour.exists?(year: 2021)
  tour = Tour.create!(year: 2021, start_date: '2021-06-26', finish_date: '2021-07-18')

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

  register_player('Bill Mackenzie', 2021)
  register_player('Brad Sokol', 2021)
  register_player('Brian Power', 2021)
  register_player('Edward Quan', 2021)
  register_player('Eli Lee', 2021)
  register_player('Gord Coutts', 2021)
  register_player('Keven Fitzpatrick', 2021)
  register_player('Kevin Blick', 2021)
  register_player('Malcolm Owen', 2021)
  register_player('Marc Tohir', 2021)
  register_player('Peter Zoras', 2021)
  register_player('Roger Partington', 2021)
  register_player('Ross Woolford', 2021)
  register_player('Shelagh McIvor', 2021)
end
