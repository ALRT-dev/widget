import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';

final kDummyHazardCategories = [
  HazardCategory(
    id: '1',
    name: '⛰️ Landslide',
  ),
  HazardCategory(
    id: '2',
    name: '🌊 Flood',
  ),
  HazardCategory(
    id: '3',
    name: '🌍 Earthquake',
  ),
  HazardCategory(
    id: '4',
    name: '🔥 Wildfire',
  ),
  HazardCategory(
    id: '5',
    name: '🌪️ Tornado',
  ),
];

final kDummyHazards = [
  Hazard(
    id: '1',
    title: 'Landslide in Kathmandu',
    category: HazardCategory(
      id: '1',
      name: 'Landslide',
    ),
    description: 'A massive landslide has occurred in Kathmandu.',
    location: AlrtLocation(
      latitude: 27.7172,
      longitude: 85.3240,
      address: 'Kathmandu, Nepal',
    ),
    createdAt: DateTime.utc(2025, 10, 1, 10, 0, 0),
  ),
  Hazard(
    id: '2',
    title: 'Flood in Chitwan',
    category: HazardCategory(
      id: '2',
      name: 'Flood',
    ),
    description: 'Severe flooding reported in Chitwan area.',
    location: AlrtLocation(
      latitude: 27.5291,
      longitude: 84.3542,
      address: 'Chitwan, Nepal',
    ),
    createdAt: DateTime.utc(2025, 9, 30, 12, 30, 0),
  ),
  Hazard(
    id: '3',
    title: 'Earthquake near Pokhara',
    category: HazardCategory(
      id: '3',
      name: 'Earthquake',
    ),
    description: 'A 5.6 magnitude earthquake struck near Pokhara.',
    location: AlrtLocation(
      latitude: 28.2096,
      longitude: 83.9856,
      address: 'Pokhara, Nepal',
    ),
    createdAt: DateTime.utc(2025, 9, 28, 14, 15, 0),
  ),
  Hazard(
    id: '4',
    title: 'Wildfire in Bardiya',
    category: HazardCategory(
      id: '4',
      name: 'Wildfire',
    ),
    description: 'Wildfire spreading rapidly in Bardiya National Park.',
    location: AlrtLocation(
      latitude: 28.3560,
      longitude: 81.4910,
      address: 'Bardiya, Nepal',
    ),
    createdAt: DateTime.utc(2024, 3, 4, 16, 45, 0),
  ),
  Hazard(
    id: '5',
    title: 'Tornado in Biratnagar',
    category: HazardCategory(
      id: '5',
      name: 'Tornado',
    ),
    description: 'A tornado has caused damage in Biratnagar region.',
    location: AlrtLocation(
      latitude: 26.4525,
      longitude: 87.2718,
      address: 'Biratnagar, Nepal',
    ),
    createdAt: DateTime.utc(2023, 10, 5, 18, 0, 0),
  ),
];
