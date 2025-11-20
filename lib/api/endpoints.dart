const kUrlBase = 'http://3.26.195.127/api';
// const kUrlBase = 'http://192.168.1.67:9000/api';
const kUrlBaseDev = 'http://192.168.1.65:9000/api';

// ---------------------------- AUTH ----------------------------

const kUrlOAuthGoogle = '/auth/oauth/google';
const kUrlOAuthApple = '/auth/oauth/apple';
const kUrlRefreshToken = '/auth/refresh-token';

// ---------------------------- ONBOARDING ----------------------------

const kUrlOnboarding = '/onboarding';
const kUrlOnboardingLocation = '$kUrlOnboarding/location';
const kUrlOnboardingRadius = '$kUrlOnboarding/radius';
const kUrlOnboardingNotifications = '$kUrlOnboarding/notifications';
const kUrlOnboardingAcceptTos = '$kUrlOnboarding/accept-tos';

// ---------------------------- USER ----------------------------

const kUrlUser = '/user';

const kUrlUserProfilePicture = '$kUrlUser/profile-picture';

const kUrlSubscribeLocation = '$kUrlUser/subscribe-location';
const kUrlUnsubscribeLocation = '$kUrlUser/unsubscribe-location';
const kUrlUserLocationSubscriptions = '$kUrlUser/location-subscriptions';

const kUrlPushNotificationSettings = '$kUrlUser/push-notification-settings';

// ---------------------------- HAZARD ----------------------------

const kUrlHazards = '/hazards';
const kUrlHazardsWithSubscriptionId =
    '$kUrlHazards/hazards-with-subscription-id';
const kUrlHazardFilters = '$kUrlHazards/filters';
const kUrlHazardCategories = '/hazard-categories';
const kUrlHazardCategoriesParent = '$kUrlHazardCategories/parent';
const kUrlHazardCategoriesSub = '$kUrlHazardCategories/sub';
const kUrlHazardVote = '$kUrlHazards/{hazardId}/vote';
const kUrlHazardView = '$kUrlHazards/{hazardId}/view';

// ---------------------------- NOTIFICATION ----------------------------

const kUrlNotifications = '/notifications';
const kUrlNotificationsFeed = '$kUrlNotifications/feed';
const kUrlNotificationsPushNotificationToken =
    '$kUrlNotifications/push-notification-token';
