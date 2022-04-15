import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_menu_event.dart';
part 'navigation_menu_state.dart';

extension BlocExtension on BuildContext {
  NavigationMenuBloc get navigationMenuBloc => read<NavigationMenuBloc>();
}

class NavigationMenuBloc
    extends Bloc<NavigationMenuEvent, NavigationMenuState> {
  NavigationMenuBloc()
      : super(
          NavigationMenuState.initial(
            pages: _pages,
            selectedNavigationPage: _pages[0],
          ),
        ) {
    on<JumpToPage>(_onJumpToPage);
    on<ShowNavigationMenu>(_onShowNavigationMenu);
  }

  void jumpToPage(NavigationMenuPage navigationMenuPage) {
    add(JumpToPage(navigationMenuPage));
  }

  void openNavigationMenu() {
    add(const ShowNavigationMenu(true));
  }

  void closeNavigationMenu() {
    add(const ShowNavigationMenu(false));
  }

  void _onJumpToPage(
    JumpToPage event,
    Emitter<NavigationMenuState> emit,
  ) {
    emit(state.copyWith(
      selectedNavigationPage: _pages[event.navigationMenuPage.value],
      showNavigationMenu: false,
    ));
  }

  void _onShowNavigationMenu(
    ShowNavigationMenu event,
    Emitter<NavigationMenuState> emit,
  ) {
    emit(state.copyWith(showNavigationMenu: event.showNavigationMenu));
  }
}

enum NavigationMenuPage {
  home,
  about,
  popular,
  features,
  offer,
}

class NavigationPage {
  const NavigationPage({
    required this.navigationMenuPage,
    required this.name,
  });

  final NavigationMenuPage navigationMenuPage;
  final String name;
}

const List<NavigationPage> _pages = [
  NavigationPage(
    navigationMenuPage: NavigationMenuPage.home,
    name: 'Home',
  ),
  NavigationPage(
    navigationMenuPage: NavigationMenuPage.about,
    name: 'About',
  ),
  NavigationPage(
    navigationMenuPage: NavigationMenuPage.popular,
    name: 'Popular',
  ),
  NavigationPage(
    navigationMenuPage: NavigationMenuPage.features,
    name: 'Features',
  ),
  NavigationPage(
    navigationMenuPage: NavigationMenuPage.offer,
    name: 'Offer',
  ),
];

extension NavigationExtension on NavigationMenuPage {
  int get value {
    switch (this) {
      case NavigationMenuPage.home:
        return 0;
      case NavigationMenuPage.about:
        return 1;
      case NavigationMenuPage.popular:
        return 2;
      case NavigationMenuPage.features:
        return 3;
      case NavigationMenuPage.offer:
        return 4;
    }
  }
}
