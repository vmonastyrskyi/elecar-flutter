part of 'navigation_menu_bloc.dart';

class NavigationMenuState extends Equatable {
  const NavigationMenuState._({
    required this.showNavigationMenu,
    required this.pages,
    required this.selectedNavigationPage,
  });

  const NavigationMenuState.initial({
    required List<NavigationPage> pages,
    required NavigationPage selectedNavigationPage,
  }) : this._(
          showNavigationMenu: false,
          pages: pages,
          selectedNavigationPage: selectedNavigationPage,
        );

  final bool showNavigationMenu;
  final List<NavigationPage> pages;
  final NavigationPage selectedNavigationPage;

  NavigationMenuState copyWith({
    int? currentPageIndex,
    bool? showNavigationMenu,
    NavigationPage? selectedNavigationPage,
  }) =>
      NavigationMenuState._(
        showNavigationMenu: showNavigationMenu ?? this.showNavigationMenu,
        selectedNavigationPage:
            selectedNavigationPage ?? this.selectedNavigationPage,
        pages: pages,
      );

  @override
  List<Object> get props => [
        showNavigationMenu,
        pages,
        selectedNavigationPage,
      ];
}
