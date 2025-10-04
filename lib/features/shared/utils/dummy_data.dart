// import 'package:hazard_app/features/map/models/alrt_location_model.dart';
// import 'package:hazard_app/features/shared/enums/hazard_severity_types.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
// import 'package:hazard_app/features/shared/models/hazard_model.dart';

final kDummyHazardCategories = [
  HazardCategory(id: '1', name: 'Safety & Security', emoji: '🔒'),
  HazardCategory(id: '2', name: 'Transport & Travel', emoji: '🚉'),
  HazardCategory(id: '3', name: 'Weather & Environment', emoji: '🌦'),
  HazardCategory(id: '4', name: 'Health & Emergency', emoji: '🚑'),
  HazardCategory(id: '5', name: 'Infrastructure & Services', emoji: '💡'),
  HazardCategory(id: '6', name: 'Crowds & Events', emoji: '👥'),
  HazardCategory(id: '7', name: 'Advisory / Info', emoji: 'ℹ️'),
];

final kDummyHazards = [
  // Hazard(
  //   id: '1',
  //   title: 'Landslide in Kathmandu',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.emergency,
  //   shortDescription: 'A massive landslide has occurred in Kathmandu.',
  //   location: AlrtLocation(
  //     latitude: 27.7172,
  //     longitude: 85.3240,
  //     address: 'Kathmandu, Nepal',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 10, 0, 0),
  // ),
  // Hazard(
  //   id: '2',
  //   title: 'Flood in Chitwan',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.watchAndAct,
  //   shortDescription: 'Severe flooding reported in Chitwan area.',
  //   location: AlrtLocation(
  //     latitude: 27.5291,
  //     longitude: 84.3542,
  //     address: 'Chitwan, Nepal',
  //   ),
  //   createdAt: DateTime.utc(2025, 9, 30, 12, 30, 0),
  // ),
  // Hazard(
  //   id: '3',
  //   title: 'Earthquake near Pokhara',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.emergency,
  //   shortDescription: 'A 5.6 magnitude earthquake struck near Pokhara.',
  //   location: AlrtLocation(
  //     latitude: 28.2096,
  //     longitude: 83.9856,
  //     address: 'Pokhara, Nepal',
  //   ),
  //   createdAt: DateTime.utc(2025, 9, 28, 14, 15, 0),
  // ),
  // Hazard(
  //   id: '4',
  //   title: 'Wildfire in Bardiya',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.emergency,
  //   shortDescription: 'Wildfire spreading rapidly in Bardiya National Park.',
  //   location: AlrtLocation(
  //     latitude: 28.3560,
  //     longitude: 81.4910,
  //     address: 'Bardiya, Nepal',
  //   ),
  //   createdAt: DateTime.utc(2024, 3, 4, 16, 45, 0),
  // ),
  // Hazard(
  //   id: '5',
  //   title: 'Tornado in Biratnagar',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.emergency,
  //   shortDescription: 'A tornado has caused damage in Biratnagar region.',
  //   location: AlrtLocation(
  //     latitude: 26.4525,
  //     longitude: 87.2718,
  //     address: 'Biratnagar, Nepal',
  //   ),
  //   createdAt: DateTime.utc(2023, 10, 5, 18, 0, 0),
  // ),
  // Hazard(
  //   id: '6',
  //   title: 'Flood near Bagmati River',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.watchAndAct,
  //   shortDescription:
  //       'The Bagmati River overflowed due to heavy rainfall, causing localized flooding.',
  //   location: AlrtLocation(
  //     latitude: 27.6931,
  //     longitude: 85.3145,
  //     address: 'Bagmati River, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 11, 0, 0),
  // ),
  // Hazard(
  //   id: '7',
  //   title: 'Earthquake tremor felt in Thamel',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.advice,
  //   shortDescription: 'Mild earthquake tremor shook buildings in Thamel area.',
  //   location: AlrtLocation(
  //     latitude: 27.7154,
  //     longitude: 85.3123,
  //     address: 'Thamel, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 11, 30, 0),
  // ),
  // Hazard(
  //   id: '8',
  //   title: 'Wildfire in Shivapuri forest',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.emergency,
  //   shortDescription:
  //       'A wildfire has broken out in the Shivapuri National Park forest area.',
  //   location: AlrtLocation(
  //     latitude: 27.8333,
  //     longitude: 85.3667,
  //     address: 'Shivapuri National Park, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 12, 0, 0),
  // ),
  // Hazard(
  //   id: '9',
  //   title: 'Building collapse in Baneshwor',
  //   category: kDummyHazardCategories[4], // Infrastructure & Services
  //   severity: HazardSeverity.emergency,
  //   shortDescription:
  //       'A residential building collapsed due to weak structure and recent tremors.',
  //   location: AlrtLocation(
  //     latitude: 27.7033,
  //     longitude: 85.3333,
  //     address: 'Baneshwor, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 12, 30, 0),
  // ),
  // Hazard(
  //   id: '10',
  //   title: 'Tornado spotted in Bhaktapur outskirts',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.watchAndAct,
  //   shortDescription:
  //       'A small tornado was spotted on the outskirts near Bhaktapur, affecting nearby houses.',
  //   location: AlrtLocation(
  //     latitude: 27.6710,
  //     longitude: 85.4298,
  //     address: 'Bhaktapur outskirts, Kathmandu Valley',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 13, 0, 0),
  // ),
  // Hazard(
  //   id: '11',
  //   title: 'Flooded streets in Patan',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.advice,
  //   shortDescription:
  //       'Monsoon rains caused waterlogging in Patan Durbar Square area.',
  //   location: AlrtLocation(
  //     latitude: 27.6722,
  //     longitude: 85.3240,
  //     address: 'Patan, Lalitpur',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 13, 30, 0),
  // ),
  // Hazard(
  //   id: '12',
  //   title: 'Gas leak in Baneshwor',
  //   category: kDummyHazardCategories[3], // Health & Emergency
  //   severity: HazardSeverity.emergency,
  //   shortDescription:
  //       'A gas leak was reported in a small factory near Baneshwor.',
  //   location: AlrtLocation(
  //     latitude: 27.7030,
  //     longitude: 85.3345,
  //     address: 'Baneshwor, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 14, 0, 0),
  // ),
  // Hazard(
  //   id: '13',
  //   title: 'Fire outbreak in Kalimati market',
  //   category: kDummyHazardCategories[3], // Health & Emergency
  //   severity: HazardSeverity.emergency,
  //   shortDescription:
  //       'A fire broke out in the crowded Kalimati vegetable market.',
  //   location: AlrtLocation(
  //     latitude: 27.6915,
  //     longitude: 85.3010,
  //     address: 'Kalimati, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 14, 30, 0),
  // ),
  // Hazard(
  //   id: '14',
  //   title: 'Power outage in Bhaktapur',
  //   category: kDummyHazardCategories[4], // Infrastructure & Services
  //   severity: HazardSeverity.info,
  //   shortDescription:
  //       'Large parts of Bhaktapur experienced blackout due to storm.',
  //   location: AlrtLocation(
  //     latitude: 27.6710,
  //     longitude: 85.4298,
  //     address: 'Bhaktapur, Nepal',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 15, 0, 0),
  // ),
  // Hazard(
  //   id: '15',
  //   title: 'Structural damage at Dharahara',
  //   category: kDummyHazardCategories[4], // Infrastructure & Services
  //   severity: HazardSeverity.watchAndAct,
  //   shortDescription:
  //       'Cracks appeared in Dharahara tower after recent tremors.',
  //   location: AlrtLocation(
  //     latitude: 27.7039,
  //     longitude: 85.3157,
  //     address: 'Dharahara, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 15, 15, 0),
  // ),
  // Hazard(
  //   id: '16',
  //   title: 'Earthquake tremors in Lalitpur',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.advice,
  //   shortDescription: 'People rushed out of their homes after mild tremors.',
  //   location: AlrtLocation(
  //     latitude: 27.6588,
  //     longitude: 85.3247,
  //     address: 'Lalitpur, Nepal',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 15, 30, 0),
  // ),
  // Hazard(
  //   id: '17',
  //   title: 'Heavy rainfall in Kirtipur',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.advice,
  //   shortDescription:
  //       'Continuous rainfall flooded low-lying roads in Kirtipur.',
  //   location: AlrtLocation(
  //     latitude: 27.6675,
  //     longitude: 85.2780,
  //     address: 'Kirtipur, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 16, 0, 0),
  // ),
  // Hazard(
  //   id: '18',
  //   title: 'Small landslide in Sundarijal',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.watchAndAct,
  //   shortDescription:
  //       'Road blocked due to small landslide near Sundarijal hiking trail.',
  //   location: AlrtLocation(
  //     latitude: 27.7892,
  //     longitude: 85.4253,
  //     address: 'Sundarijal, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 16, 30, 0),
  // ),
  // Hazard(
  //   id: '19',
  //   title: 'Bridge collapse in Gorkha',
  //   category: kDummyHazardCategories[4], // Infrastructure & Services
  //   severity: HazardSeverity.emergency,
  //   shortDescription: 'A suspension bridge collapsed due to rust and overuse.',
  //   location: AlrtLocation(
  //     latitude: 28.0135,
  //     longitude: 84.6339,
  //     address: 'Gorkha, Nepal',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 17, 0, 0),
  // ),
  // Hazard(
  //   id: '20',
  //   title: 'Robbery reported in New Road',
  //   category: kDummyHazardCategories[0], // Safety & Security
  //   severity: HazardSeverity.info,
  //   shortDescription: 'Two individuals reported being robbed at New Road.',
  //   location: AlrtLocation(
  //     latitude: 27.7045,
  //     longitude: 85.3073,
  //     address: 'New Road, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 17, 30, 0),
  // ),
  // Hazard(
  //   id: '21',
  //   title: 'Pickpocketing in Ratnapark',
  //   category: kDummyHazardCategories[0], // Safety & Security
  //   severity: HazardSeverity.info,
  //   shortDescription:
  //       'Several cases of pickpocketing reported in crowded Ratnapark.',
  //   location: AlrtLocation(
  //     latitude: 27.7080,
  //     longitude: 85.3130,
  //     address: 'Ratnapark, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 18, 0, 0),
  // ),
  // Hazard(
  //   id: '22',
  //   title: 'Explosion in a workshop, Balaju',
  //   category: kDummyHazardCategories[3], // Health & Emergency
  //   severity: HazardSeverity.emergency,
  //   shortDescription:
  //       'Small explosion injured two people in a Balaju workshop.',
  //   location: AlrtLocation(
  //     latitude: 27.7400,
  //     longitude: 85.3080,
  //     address: 'Balaju, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 18, 30, 0),
  // ),
  // Hazard(
  //   id: '23',
  //   title: 'Fire in Thamel hotel',
  //   category: kDummyHazardCategories[3], // Health & Emergency
  //   severity: HazardSeverity.emergency,
  //   shortDescription: 'A fire broke out in a hotel kitchen in Thamel.',
  //   location: AlrtLocation(
  //     latitude: 27.7154,
  //     longitude: 85.3123,
  //     address: 'Thamel, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 19, 0, 0),
  // ),
  // Hazard(
  //   id: '24',
  //   title: 'Avalanche in Manang',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.emergency,
  //   shortDescription: 'Heavy snow caused avalanche blocking trekking route.',
  //   location: AlrtLocation(
  //     latitude: 28.6686,
  //     longitude: 84.0190,
  //     address: 'Manang, Nepal',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 19, 30, 0),
  // ),
  // Hazard(
  //   id: '25',
  //   title: 'Tsunami warning in coastal region',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.emergency,
  //   shortDescription:
  //       'Authorities issued a tsunami warning after undersea quake (simulation).',
  //   location: AlrtLocation(
  //     latitude: 27.0,
  //     longitude: 86.0,
  //     address: 'Hypothetical, Nepal',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 20, 0, 0),
  // ),
  // Hazard(
  //   id: '26',
  //   title: 'Cyclone effect reaching Eastern Nepal',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.watchAndAct,
  //   shortDescription:
  //       'Cyclone from Bay of Bengal causing heavy winds in eastern Nepal.',
  //   location: AlrtLocation(
  //     latitude: 26.6675,
  //     longitude: 88.0,
  //     address: 'Eastern Nepal',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 20, 30, 0),
  // ),
  // Hazard(
  //   id: '27',
  //   title: 'Chemical spill in Biratnagar factory',
  //   category: kDummyHazardCategories[3], // Health & Emergency
  //   severity: HazardSeverity.emergency,
  //   shortDescription: 'Toxic chemical leak in industrial zone caused panic.',
  //   location: AlrtLocation(
  //     latitude: 26.4525,
  //     longitude: 87.2718,
  //     address: 'Biratnagar, Nepal',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 21, 0, 0),
  // ),
  // Hazard(
  //   id: '28',
  //   title: 'Epidemic outbreak in Terai region',
  //   category: kDummyHazardCategories[3], // Health & Emergency
  //   severity: HazardSeverity.watchAndAct,
  //   shortDescription:
  //       'Health officials reported spread of waterborne diseases.',
  //   location: AlrtLocation(
  //     latitude: 27.0,
  //     longitude: 85.0,
  //     address: 'Terai Region, Nepal',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 21, 30, 0),
  // ),
  // Hazard(
  //   id: '29',
  //   title: 'Pest infestation in Kavre farms',
  //   category: kDummyHazardCategories[6], // Advisory / Info
  //   severity: HazardSeverity.info,
  //   shortDescription: 'Farmers in Kavre reported locust infestation.',
  //   location: AlrtLocation(
  //     latitude: 27.6270,
  //     longitude: 85.5486,
  //     address: 'Kavre, Nepal',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 22, 0, 0),
  // ),
  // Hazard(
  //   id: '30',
  //   title: 'Violence reported in Gongabu bus park',
  //   category: kDummyHazardCategories[0], // Safety & Security
  //   severity: HazardSeverity.watchAndAct,
  //   shortDescription: 'Group clash turned violent at Gongabu bus park.',
  //   location: AlrtLocation(
  //     latitude: 27.7392,
  //     longitude: 85.3150,
  //     address: 'Gongabu, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 22, 30, 0),
  // ),
  // Hazard(
  //   id: '31',
  //   title: 'Road accident in Kalanki',
  //   category: kDummyHazardCategories[1], // Transport & Travel
  //   severity: HazardSeverity.watchAndAct,
  //   shortDescription: 'A bus and truck collision blocked highway at Kalanki.',
  //   location: AlrtLocation(
  //     latitude: 27.6930,
  //     longitude: 85.2813,
  //     address: 'Kalanki, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 23, 0, 0),
  // ),
  // Hazard(
  //   id: '32',
  //   title: 'Bridge cracks in Sankhu',
  //   category: kDummyHazardCategories[4], // Infrastructure & Services
  //   severity: HazardSeverity.advice,
  //   shortDescription: 'Old bridge in Sankhu developed major cracks.',
  //   location: AlrtLocation(
  //     latitude: 27.8015,
  //     longitude: 85.4455,
  //     address: 'Sankhu, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 1, 23, 30, 0),
  // ),
  // Hazard(
  //   id: '33',
  //   title: 'Assault case reported in Lazimpat',
  //   category: kDummyHazardCategories[0], // Safety & Security
  //   severity: HazardSeverity.info,
  //   shortDescription: 'Police reported a late-night assault case in Lazimpat.',
  //   location: AlrtLocation(
  //     latitude: 27.7253,
  //     longitude: 85.3267,
  //     address: 'Lazimpat, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 0, 0, 0),
  // ),
  // Hazard(
  //   id: '34',
  //   title: 'Flash flood in Dolakha',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.emergency,
  //   shortDescription: 'Flash floods swept away houses in Dolakha.',
  //   location: AlrtLocation(
  //     latitude: 27.75,
  //     longitude: 86.0,
  //     address: 'Dolakha, Nepal',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 0, 30, 0),
  // ),
  // Hazard(
  //   id: '35',
  //   title: 'Landslide in Sindhupalchok highway',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.watchAndAct,
  //   shortDescription: 'Landslide blocked Araniko Highway in Sindhupalchok.',
  //   location: AlrtLocation(
  //     latitude: 27.9,
  //     longitude: 85.8,
  //     address: 'Sindhupalchok, Nepal',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 1, 0, 0),
  // ),
  // Hazard(
  //   id: '36',
  //   title: 'Cyber attack on Kathmandu bank',
  //   category: kDummyHazardCategories[0], // Safety & Security
  //   severity: HazardSeverity.watchAndAct,
  //   shortDescription: 'Bank servers went offline due to cyber intrusion.',
  //   location: AlrtLocation(
  //     latitude: 27.7172,
  //     longitude: 85.3240,
  //     address: 'Kathmandu, Nepal',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 1, 30, 0),
  // ),
  // Hazard(
  //   id: '37',
  //   title: 'Storm damages houses in Lalitpur',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.advice,
  //   shortDescription: 'Strong storm damaged roofs of several houses.',
  //   location: AlrtLocation(
  //     latitude: 27.65,
  //     longitude: 85.32,
  //     address: 'Lalitpur, Nepal',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 2, 0, 0),
  // ),
  // Hazard(
  //   id: '38',
  //   title: 'Power blackout in Pokhara',
  //   category: kDummyHazardCategories[4], // Infrastructure & Services
  //   severity: HazardSeverity.info,
  //   shortDescription: 'Entire Pokhara valley faced power blackout for 3 hours.',
  //   location: AlrtLocation(
  //     latitude: 28.2096,
  //     longitude: 83.9856,
  //     address: 'Pokhara, Nepal',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 2, 30, 0),
  // ),
  // Hazard(
  //   id: '39',
  //   title: 'Building fire in Jawalakhel',
  //   category: kDummyHazardCategories[3], // Health & Emergency
  //   severity: HazardSeverity.emergency,
  //   shortDescription: 'A multi-story building caught fire in Jawalakhel.',
  //   location: AlrtLocation(
  //     latitude: 27.6735,
  //     longitude: 85.3148,
  //     address: 'Jawalakhel, Lalitpur',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 3, 0, 0),
  // ),
  // Hazard(
  //   id: '40',
  //   title: 'Drought reported in Terai',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.advice,
  //   shortDescription: 'Farmers in Terai reported severe drought conditions.',
  //   location: AlrtLocation(
  //     latitude: 27.1,
  //     longitude: 84.9,
  //     address: 'Terai Region, Nepal',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 3, 30, 0),
  // ),
  // Hazard(
  //   id: '41',
  //   title: 'Landslide near Budanilkantha temple road',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.watchAndAct,
  //   shortDescription:
  //       'Heavy rain triggered a landslide blocking the road to Budanilkantha temple.',
  //   location: AlrtLocation(
  //     latitude: 27.8015,
  //     longitude: 85.3550,
  //     address: 'Budanilkantha Temple, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 8, 0, 0),
  // ),
  // Hazard(
  //   id: '42',
  //   title: 'Flash flood in Budanilkantha river stream',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.advice,
  //   shortDescription:
  //       'A sudden flash flood swept through small river streams near Budanilkantha.',
  //   location: AlrtLocation(
  //     latitude: 27.8070,
  //     longitude: 85.3600,
  //     address: 'Budanilkantha, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 8, 30, 0),
  // ),
  // Hazard(
  //   id: '43',
  //   title: 'Wildfire in Shivapuri forest near Budanilkantha',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.emergency,
  //   shortDescription:
  //       'A wildfire has been reported spreading in Shivapuri forest close to Budanilkantha.',
  //   location: AlrtLocation(
  //     latitude: 27.8200,
  //     longitude: 85.3650,
  //     address: 'Shivapuri forest, Budanilkantha',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 9, 0, 0),
  // ),
  // Hazard(
  //   id: '44',
  //   title: 'Road accident on Budanilkantha highway',
  //   category: kDummyHazardCategories[1], // Transport & Travel
  //   severity: HazardSeverity.info,
  //   shortDescription:
  //       'A truck and motorbike collided on Budanilkantha highway.',
  //   location: AlrtLocation(
  //     latitude: 27.8055,
  //     longitude: 85.3520,
  //     address: 'Budanilkantha highway, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 9, 30, 0),
  // ),
  // Hazard(
  //   id: '45',
  //   title: 'Power outage in Budanilkantha wards',
  //   category: kDummyHazardCategories[4], // Infrastructure & Services
  //   severity: HazardSeverity.info,
  //   shortDescription:
  //       'Residents faced complete blackout due to transformer damage.',
  //   location: AlrtLocation(
  //     latitude: 27.8040,
  //     longitude: 85.3570,
  //     address: 'Budanilkantha, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 10, 0, 0),
  // ),
  // Hazard(
  //   id: '46',
  //   title: 'Pickpocketing case at Budanilkantha bus stop',
  //   category: kDummyHazardCategories[0], // Safety & Security
  //   severity: HazardSeverity.info,
  //   shortDescription:
  //       'Several passengers reported stolen wallets at a busy bus stop.',
  //   location: AlrtLocation(
  //     latitude: 27.8065,
  //     longitude: 85.3500,
  //     address: 'Budanilkantha bus stop, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 10, 30, 0),
  // ),
  // Hazard(
  //   id: '47',
  //   title: 'Small landslide blocking hiking trail',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.advice,
  //   shortDescription:
  //       'Tourists reported a small landslide blocking a hiking trail to Shivapuri.',
  //   location: AlrtLocation(
  //     latitude: 27.8150,
  //     longitude: 85.3700,
  //     address: 'Shivapuri hiking trail, Budanilkantha',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 11, 0, 0),
  // ),
  // Hazard(
  //   id: '48',
  //   title: 'Heavy rainfall causes waterlogging',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.advice,
  //   shortDescription:
  //       'Continuous rainfall caused waterlogging in residential areas.',
  //   location: AlrtLocation(
  //     latitude: 27.8080,
  //     longitude: 85.3580,
  //     address: 'Budanilkantha, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 11, 30, 0),
  // ),
  // Hazard(
  //   id: '49',
  //   title: 'Wild monkeys attack locals',
  //   category: kDummyHazardCategories[0], // Safety & Security
  //   severity: HazardSeverity.info,
  //   shortDescription:
  //       'Aggressive monkeys from Shivapuri entered neighborhoods and injured locals.',
  //   location: AlrtLocation(
  //     latitude: 27.8120,
  //     longitude: 85.3560,
  //     address: 'Budanilkantha hillside, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 12, 0, 0),
  // ),
  // Hazard(
  //   id: '50',
  //   title: 'House fire in Budanilkantha neighborhood',
  //   category: kDummyHazardCategories[3], // Health & Emergency
  //   severity: HazardSeverity.watchAndAct,
  //   shortDescription:
  //       'A fire broke out in a residential house near Budanilkantha school area.',
  //   location: AlrtLocation(
  //     latitude: 27.8030,
  //     longitude: 85.3540,
  //     address: 'Budanilkantha school area, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 12, 30, 0),
  // ),
  // Hazard(
  //   id: '51',
  //   title: 'Flooded streets in Golfutar',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.advice,
  //   shortDescription: 'Heavy rainfall caused street flooding in Golfutar area.',
  //   location: AlrtLocation(
  //     latitude: 27.7830,
  //     longitude: 85.3490,
  //     address: 'Golfutar, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 13, 0, 0),
  // ),
  // Hazard(
  //   id: '52',
  //   title: 'Landslide near Golfutar hillside',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.watchAndAct,
  //   shortDescription:
  //       'Minor landslide occurred on a hillside near Golfutar settlement.',
  //   location: AlrtLocation(
  //     latitude: 27.7850,
  //     longitude: 85.3510,
  //     address: 'Golfutar hillside, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 13, 30, 0),
  // ),
  // Hazard(
  //   id: '53',
  //   title: 'House fire in Hattigauda neighborhood',
  //   category: kDummyHazardCategories[3], // Health & Emergency
  //   severity: HazardSeverity.watchAndAct,
  //   shortDescription:
  //       'Electrical short circuit led to a house fire in Hattigauda.',
  //   location: AlrtLocation(
  //     latitude: 27.7800,
  //     longitude: 85.3525,
  //     address: 'Hattigauda, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 14, 0, 0),
  // ),
  // Hazard(
  //   id: '54',
  //   title: 'Traffic accident in Hattigauda road',
  //   category: kDummyHazardCategories[1], // Transport & Travel
  //   severity: HazardSeverity.info,
  //   shortDescription:
  //       'A motorbike collided with a taxi on Hattigauda main road.',
  //   location: AlrtLocation(
  //     latitude: 27.7790,
  //     longitude: 85.3540,
  //     address: 'Hattigauda road, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 14, 30, 0),
  // ),
  // Hazard(
  //   id: '55',
  //   title: 'Power outage in Golfutar area',
  //   category: kDummyHazardCategories[4], // Infrastructure & Services
  //   severity: HazardSeverity.info,
  //   shortDescription:
  //       'Transformer malfunction caused blackout in Golfutar neighborhoods.',
  //   location: AlrtLocation(
  //     latitude: 27.7825,
  //     longitude: 85.3475,
  //     address: 'Golfutar, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 15, 0, 0),
  // ),
  // Hazard(
  //   id: '56',
  //   title: 'Pickpocketing case in Golfutar bus stop',
  //   category: kDummyHazardCategories[0], // Safety & Security
  //   severity: HazardSeverity.info,
  //   shortDescription:
  //       'Passengers reported stolen wallets at Golfutar bus stop.',
  //   location: AlrtLocation(
  //     latitude: 27.7838,
  //     longitude: 85.3488,
  //     address: 'Golfutar bus stop, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 15, 30, 0),
  // ),
  // Hazard(
  //   id: '57',
  //   title: 'Heavy rainfall in Hattigauda',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.advice,
  //   shortDescription:
  //       'Downpour caused road blockages and localized flooding in Hattigauda.',
  //   location: AlrtLocation(
  //     latitude: 27.7780,
  //     longitude: 85.3530,
  //     address: 'Hattigauda, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 16, 0, 0),
  // ),
  // Hazard(
  //   id: '58',
  //   title: 'Structural crack in Golfutar building',
  //   category: kDummyHazardCategories[4], // Infrastructure & Services
  //   severity: HazardSeverity.advice,
  //   shortDescription:
  //       'An old residential building in Golfutar developed deep cracks.',
  //   location: AlrtLocation(
  //     latitude: 27.7845,
  //     longitude: 85.3500,
  //     address: 'Golfutar, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 16, 30, 0),
  // ),
  // Hazard(
  //   id: '59',
  //   title: 'Robbery case reported in Hattigauda shop',
  //   category: kDummyHazardCategories[0], // Safety & Security
  //   severity: HazardSeverity.info,
  //   shortDescription:
  //       'A small grocery shop in Hattigauda was robbed late at night.',
  //   location: AlrtLocation(
  //     latitude: 27.7795,
  //     longitude: 85.3555,
  //     address: 'Hattigauda, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 17, 0, 0),
  // ),
  // Hazard(
  //   id: '60',
  //   title: 'Monkey attack in Golfutar',
  //   category: kDummyHazardCategories[0], // Safety & Security
  //   severity: HazardSeverity.info,
  //   shortDescription:
  //       'Locals reported monkeys attacking passersby near Golfutar hillside.',
  //   location: AlrtLocation(
  //     latitude: 27.7860,
  //     longitude: 85.3520,
  //     address: 'Golfutar hillside, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 17, 30, 0),
  // ),
  // Hazard(
  //   id: '61',
  //   title: 'Flooding near Baluwatar',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.advice,
  //   shortDescription:
  //       'Drainage overflow caused street flooding near Baluwatar residences.',
  //   location: AlrtLocation(
  //     latitude: 27.7285,
  //     longitude: 85.3300,
  //     address: 'Baluwatar, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 18, 0, 0),
  // ),
  // Hazard(
  //   id: '62',
  //   title: 'Landslide blocking road in Tokha-Chhahare',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.watchAndAct,
  //   shortDescription:
  //       'Rainfall triggered a hillside landslide blocking the Tokha–Chhahare road.',
  //   location: AlrtLocation(
  //     latitude: 27.7830,
  //     longitude: 85.3210,
  //     address: 'Tokha–Chhahare road, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 18, 30, 0),
  // ),
  // Hazard(
  //   id: '63',
  //   title: 'Transformer explosion in Gongabu',
  //   category: kDummyHazardCategories[4], // Infrastructure & Services
  //   severity: HazardSeverity.watchAndAct,
  //   shortDescription:
  //       'Residents reported a loud blast due to transformer failure.',
  //   location: AlrtLocation(
  //     latitude: 27.7370,
  //     longitude: 85.3075,
  //     address: 'Gongabu, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 19, 0, 0),
  // ),
  // Hazard(
  //   id: '64',
  //   title: 'Bus accident in Samakhusi road',
  //   category: kDummyHazardCategories[1], // Transport & Travel
  //   severity: HazardSeverity.emergency,
  //   shortDescription:
  //       'A passenger bus lost control and collided with roadside shops.',
  //   location: AlrtLocation(
  //     latitude: 27.7405,
  //     longitude: 85.3190,
  //     address: 'Samakhusi, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 19, 30, 0),
  // ),
  // Hazard(
  //   id: '65',
  //   title: 'Fire outbreak in Tokha bazar',
  //   category: kDummyHazardCategories[3], // Health & Emergency
  //   severity: HazardSeverity.emergency,
  //   shortDescription:
  //       'A grocery shop caught fire, spreading to adjacent stores.',
  //   location: AlrtLocation(
  //     latitude: 27.7580,
  //     longitude: 85.3370,
  //     address: 'Tokha Bazar, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 20, 0, 0),
  // ),
  // Hazard(
  //   id: '66',
  //   title: 'Pickpocketing case in Kalanki bus stop',
  //   category: kDummyHazardCategories[0], // Safety & Security
  //   severity: HazardSeverity.info,
  //   shortDescription:
  //       'Several travelers reported stolen belongings in crowded bus station.',
  //   location: AlrtLocation(
  //     latitude: 27.6900,
  //     longitude: 85.2840,
  //     address: 'Kalanki bus stop, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 20, 30, 0),
  // ),
  // Hazard(
  //   id: '67',
  //   title: 'Heavy rainfall in Budhanilkantha hillside',
  //   category: kDummyHazardCategories[2], // Weather & Environment
  //   severity: HazardSeverity.advice,
  //   shortDescription:
  //       'Continuous downpour caused soil erosion near hillside settlements.',
  //   location: AlrtLocation(
  //     latitude: 27.8100,
  //     longitude: 85.3650,
  //     address: 'Budhanilkantha hillside, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 21, 0, 0),
  // ),
  // Hazard(
  //   id: '68',
  //   title: 'Structural cracks at Tokha hospital building',
  //   category: kDummyHazardCategories[4], // Infrastructure & Services
  //   severity: HazardSeverity.watchAndAct,
  //   shortDescription:
  //       'Hospital building walls developed cracks after recent tremors.',
  //   location: AlrtLocation(
  //     latitude: 27.7655,
  //     longitude: 85.3550,
  //     address: 'Tokha hospital, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 21, 30, 0),
  // ),
  // Hazard(
  //   id: '69',
  //   title: 'Robbery reported in Lazimpat hotel',
  //   category: kDummyHazardCategories[0], // Safety & Security
  //   severity: HazardSeverity.watchAndAct,
  //   shortDescription:
  //       'Armed robbery took place in a small hotel at Lazimpat late at night.',
  //   location: AlrtLocation(
  //     latitude: 27.7260,
  //     longitude: 85.3235,
  //     address: 'Lazimpat, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 22, 0, 0),
  // ),
  // Hazard(
  //   id: '70',
  //   title: 'Power outage in Maharajgunj area',
  //   category: kDummyHazardCategories[4], // Infrastructure & Services
  //   severity: HazardSeverity.info,
  //   shortDescription:
  //       'Sudden blackout affected residential blocks in Maharajgunj.',
  //   location: AlrtLocation(
  //     latitude: 27.7415,
  //     longitude: 85.3360,
  //     address: 'Maharajgunj, Kathmandu',
  //   ),
  //   createdAt: DateTime.utc(2025, 10, 2, 22, 30, 0),
  // ),
];
