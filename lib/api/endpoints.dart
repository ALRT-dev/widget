// const kUrlBase = 'http://3.26.195.127/api';
const kUrlBase = 'http://192.168.1.67:9000/api';
const kUrlBaseDev = 'http://192.168.1.67:9000/api';

// ---------------------------- AUTH ----------------------------

const kUrlOAuthGoogle = '/auth/oauth/google';
const kUrlRefreshToken = '/auth/refresh-token';

// ---------------------------- USER ----------------------------

const kUrlUser = '/user';
const kUrlSubscribeLocation = '$kUrlUser/subscribe-location';
const kUrlUnsubscribeLocation = '$kUrlUser/unsubscribe-location';

// ---------------------------- HAZARD ----------------------------

const kUrlHazards = '/hazards';
const kUrlHazardsWithCategories = '$kUrlHazards/hazards-with-categories';
const kUrlHazardCategories = '/hazard-categories';
const kUrlHazardVote = '$kUrlHazards/{hazardId}/vote';
const kUrlHazardView = '$kUrlHazards/{hazardId}/view';

// ---------------------------- NOTIFICATION ----------------------------

const kUrlNotifications = '/notifications';
const kUrlNotificationsFeed = '$kUrlNotifications/feed';
const kUrlNotificationsPushNotificationToken =
    '$kUrlNotifications/push-notification-token';
