const kUrlBase = 'https://api.safetyalrt.com';
// const kUrlBase = 'http://192.168.1.67:9000';
const kUrlBaseDev = 'http://192.168.1.65:9000';

const kUrlApi = '/api';

// ---------------------------- AUTH ----------------------------

const kUrlAuth = '$kUrlApi/auth';

const kUrlOAuthGoogle = '$kUrlAuth/oauth/google';
const kUrlOAuthApple = '$kUrlAuth/oauth/apple';
const kUrlOAuthMicrosoft = '$kUrlAuth/oauth/microsoft';
const kUrlRefreshToken = '$kUrlAuth/refresh-token';

// ---------------------------- ONBOARDING ----------------------------

const kUrlOnboarding = '$kUrlApi/onboarding';

const kUrlOnboardingAcceptDisclaimer = '$kUrlOnboarding/accept-disclaimer';
const kUrlOnboardingAcceptTos = '$kUrlOnboarding/accept-tos';
const kUrlOnboardingLocation = '$kUrlOnboarding/location';
const kUrlOnboardingRadius = '$kUrlOnboarding/radius';
const kUrlOnboardingNotifications = '$kUrlOnboarding/notifications';

// ---------------------------- USER ----------------------------

const kUrlUser = '$kUrlApi/user';

const kUrlUserProfilePicture = '$kUrlUser/profile-picture';

const kUrlSubscribeLocation = '$kUrlUser/subscribe-location';
const kUrlUnsubscribeLocation = '$kUrlUser/unsubscribe-location';
const kUrlUserLocationSubscriptions = '$kUrlUser/location-subscriptions';
const kUrlOwnLocationSubscription = '$kUrlUser/own-location-subscription';
const kUrlOwnLocationSubscriptionRadius =
    '$kUrlUser/own-location-subscription-radius';

const kUrlPushNotificationSettings = '$kUrlUser/push-notification-settings';

const kUrlUserAccount = '$kUrlUser/account';
const kUrlUserAccountCancelDeletion = '$kUrlUserAccount/cancel-deletion';

// ---------------------------- HAZARD ----------------------------

const kUrlHazards = '$kUrlApi/hazards';
const kUrlHazardCategories = '$kUrlApi/hazard-categories';

const kUrlHazardsWithSubscriptionId =
    '$kUrlHazards/hazards-with-subscription-id';
const kUrlHazardCategoriesParent = '$kUrlHazardCategories/parent';
const kUrlHazardCategoriesSub = '$kUrlHazardCategories/sub';
const kUrlHazardVote = '$kUrlHazards/{hazardId}/vote';
const kUrlHazardView = '$kUrlHazards/{hazardId}/view';

// ---------------------------- NOTIFICATION ----------------------------

const kUrlNotifications = '$kUrlApi/notifications';

const kUrlNotificationsFeed = '$kUrlNotifications/feed';
const kUrlNotificationsPushNotificationToken =
    '$kUrlNotifications/push-notification-token';

// ---------------------------- SUPPORT ----------------------------

const kUrlSupport = '$kUrlApi/support';
