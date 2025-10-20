import 'package:hazard_app/features/shared/enums/alrt_media_source_types.dart';
import 'package:hazard_app/features/shared/enums/alrt_media_types.dart';
import 'package:hazard_app/features/shared/models/alrt_media_model.dart';

const klDummyAlrtMedias = [
  AlrtMedia(
    id: '0',
    value: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    type: AlrtMediaType.image,
    source: AlrtMediaSource.networkUrl,
  ),
  AlrtMedia(
    id: '1',
    value: 'https://images.unsplash.com/photo-1494526585095-c41746248156',
    type: AlrtMediaType.image,
    source: AlrtMediaSource.networkUrl,
  ),
  AlrtMedia(
    id: '2',
    value:
        'https://assets-cdn.kathmandupost.com/uploads/source/news/2019/environment/Massive%20landslide%20blocked%20Sunkoshi%20River%2001.jpg',
    type: AlrtMediaType.image,
    source: AlrtMediaSource.networkUrl,
  ),
];
