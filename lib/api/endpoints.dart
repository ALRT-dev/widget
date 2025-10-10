const kUrlBase = 'http://3.26.195.127/api';
const kUrlBaseDev = 'http://192.168.1.252:9000/api';

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
