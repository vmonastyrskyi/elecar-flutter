part of 'navigation_menu_bloc.dart';

abstract class NavigationMenuEvent extends Equatable {
  const NavigationMenuEvent();

  @override
  List<Object> get props => [];
}

class JumpToPage extends NavigationMenuEvent {
  const JumpToPage(this.pageIndex);

  final int pageIndex;

  @override
  List<Object> get props => [pageIndex];
}

class ShowNavigationMenu extends NavigationMenuEvent {
  const ShowNavigationMenu(this.showNavigationMenu);

  final bool showNavigationMenu;

  @override
  List<Object> get props => [showNavigationMenu];
}
