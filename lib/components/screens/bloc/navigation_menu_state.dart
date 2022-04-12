part of 'navigation_menu_bloc.dart';

enum NavigationMenuPage {
  home,
  about,
  popular,
  featured,
}

class NavigationMenuState extends Equatable {
  const NavigationMenuState._({
    required this.currentPageIndex,
    required this.showNavigationMenu,
  });

  const NavigationMenuState.initial()
      : this._(
          currentPageIndex: 0,
          showNavigationMenu: false,
        );

  final int currentPageIndex;
  final bool showNavigationMenu;

  NavigationMenuState copyWith({
    int? currentPageIndex,
    bool? showNavigationMenu,
  }) =>
      NavigationMenuState._(
        currentPageIndex: currentPageIndex ?? this.currentPageIndex,
        showNavigationMenu: showNavigationMenu ?? this.showNavigationMenu,
      );

  @override
  List<Object> get props => [
        currentPageIndex,
        showNavigationMenu,
      ];
}

extension NavigationExtension on NavigationMenuPage {
  int get value {
    switch (this) {
      case NavigationMenuPage.home:
        return 0;
      case NavigationMenuPage.about:
        return 1;
      case NavigationMenuPage.popular:
        return 2;
      case NavigationMenuPage.featured:
        return 3;
    }
  }
}
