part of 'navigation_menu_bloc.dart';

abstract class NavigationMenuEvent extends Equatable {
  const NavigationMenuEvent();

  @override
  List<Object> get props => [];
}

class JumpToPage extends NavigationMenuEvent {
  const JumpToPage(this.navigationMenuPage);

  final NavigationMenuPage navigationMenuPage;

  @override
  List<Object> get props => [navigationMenuPage];
}

class ShowNavigationMenu extends NavigationMenuEvent {
  const ShowNavigationMenu(this.showNavigationMenu);

  final bool showNavigationMenu;

  @override
  List<Object> get props => [showNavigationMenu];
}
