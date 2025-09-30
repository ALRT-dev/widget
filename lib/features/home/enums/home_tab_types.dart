enum HomeTab {
  map,
  search,
  list,
  notifications,
  profile;

  String get unselectedIconPath {
    switch (this) {
      case HomeTab.map:
        return 'assets/icons/map_tab_unselected.svg';
      case HomeTab.search:
        return 'assets/icons/search_tab_unselected.svg';
      case HomeTab.list:
        return 'assets/logos/alrt_logo.png';
      case HomeTab.notifications:
        return 'assets/icons/notifications_tab_unselected.svg';
      case HomeTab.profile:
        return '';
    }
  }

  String get selectedIconPath {
    switch (this) {
      case HomeTab.map:
        return 'assets/icons/map_tab_selected.svg';
      case HomeTab.search:
        return 'assets/icons/search_tab_selected.svg';
      case HomeTab.list:
        return 'assets/logos/alrt_logo.png';
      case HomeTab.notifications:
        return 'assets/icons/notifications_tab_selected.svg';
      case HomeTab.profile:
        return '';
    }
  }
}

/// The default tab that the user will see when they land on the home screen.
const kDefaultHomeTab = HomeTab.map;
