import 'package:hazard_app/features/profile/models/safety_cohort.dart';

/// SEED of the Standing For You Library — rows carried VERBATIM from Sarah's
/// draft ("For You Library: Extension Rows DRAFT v2"). Zero AI at generation
/// and render. This seed exists so the card can be reviewed on-device; rows
/// that fail Sarah's clinical review are removed, and the full library moves
/// to the content store later.
///
/// Keyed by a coarse hazard bucket derived from the alert's category name.
/// A missing row shows nothing — never substitute a line from another hazard.
abstract final class ForYouLibrary {
  /// Coarse bucket from an alert's (parent) category name; null = no card.
  static String? bucketForCategory(final String? categoryName) {
    if (categoryName == null) return null;
    final name = categoryName.toLowerCase();
    if (name.contains('fire') && name.contains('smoke')) return 'smoke';
    if (name.contains('fire')) return 'bushfire';
    if (name.contains('smoke')) return 'smoke';
    if (name.contains('flood')) return 'flood';
    if (name.contains('weather') || name.contains('environment')) {
      return 'severe_weather';
    }
    if (name.contains('air')) return 'air_quality';
    if (name.contains('health')) return 'air_quality';
    return null;
  }

  /// hazard bucket -> cohort -> line (verbatim draft wording).
  static const Map<String, Map<SafetyCohort, String>> rows = {
    'smoke': {
      SafetyCohort.older:
          'Smoke settles hardest on older lungs. Staying indoors with windows '
          'shut, and cooling the house rather than airing it, is advisable.',
      SafetyCohort.kids:
          'Smoke affects small lungs first. Keeping windows shut and staying '
          'indoors is advisable while smoke is nearby.',
      SafetyCohort.medical:
          'If a medical condition applies, having medication on hand and '
          'limiting exertion is advisable while smoke is nearby.',
      SafetyCohort.pets:
          'Smoke affects animals too, especially birds and older pets. '
          'Bringing them indoors and limiting exercise while smoke is nearby '
          'is advisable.',
    },
    'bushfire': {
      SafetyCohort.older:
          'Ember attacks and fast changes are hardest on people who move more '
          'slowly. Deciding early whether to leave, rather than waiting to '
          'see, is advisable.',
      SafetyCohort.kids:
          'Children breathe faster and worry spreads quickly. Packing early, '
          'keeping kids indoors and explaining the plan calmly is advisable.',
      SafetyCohort.mobility:
          'Evacuating with mobility needs takes longer than warnings allow '
          'for. Leaving well before an Emergency Warning, and telling someone '
          'your route, is advisable.',
      SafetyCohort.deaf:
          'Sirens and doorknocks may not reach you. Keeping strong vibration '
          'and screen flash alerts on, and asking a neighbour to check in, is '
          'advisable.',
      SafetyCohort.visitor:
          'Australian bushfires move faster than most visitors expect. '
          'Following the official warning level for this area and leaving '
          'early if advised is advisable.',
    },
    'flood': {
      SafetyCohort.older:
          'Flood evacuations are safest done early and in daylight. Moving '
          'medicines, glasses and essentials above floor level now is '
          'advisable.',
      SafetyCohort.kids:
          'Floodwater fascinates kids and hides currents and sharp objects. '
          'Keeping children away from all water, even shallow water over '
          'drains, is advisable.',
      SafetyCohort.visitor:
          'Never drive through floodwater, whatever your car handles at home. '
          'Most Australian flood deaths happen in vehicles.',
      SafetyCohort.pets:
          'Floodwater strands animals quickly. Moving stock to higher '
          'paddocks early is standing advice; pets travel in carriers, never '
          'loose in vehicles.',
    },
    'severe_weather': {
      SafetyCohort.older:
          'Falls rise sharply in storms and on wet ground. Postponing errands '
          'until the weather passes, and charging your phone now, is '
          'advisable.',
      SafetyCohort.kids:
          'Storms pass faster when kids are settled. Bringing outdoor toys '
          'in, charging devices and planning an indoor afternoon is '
          'advisable.',
      SafetyCohort.pets:
          'Pets often bolt in storms. Keeping them indoors with '
          'identification, and checking gates and fencing afterwards, is '
          'advisable.',
    },
    'air_quality': {
      SafetyCohort.older:
          'Poor air days are hardest on older lungs and hearts. Keeping '
          'activity light and staying indoors during the worst hours is '
          'advisable.',
      SafetyCohort.kids:
          'Children take in more air for their size. Moving play indoors and '
          'keeping windows shut on poor air days is advisable.',
      SafetyCohort.medical:
          'Poor air can build symptoms slowly across a day. Following your '
          'usual care plan, keeping medication within reach and skipping '
          'strenuous activity is advisable.',
    },
  };
}
