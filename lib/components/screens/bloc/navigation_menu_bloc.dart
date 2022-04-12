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
  NavigationMenuBloc() : super(const NavigationMenuState.initial()) {
    on<JumpToPage>(_onJumpToPage);
    on<ShowNavigationMenu>(_onShowNavigationMenu);
  }

  void jumpToPage(NavigationMenuPage page) {
    add(JumpToPage(page.value));
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
    emit(state.copyWith(currentPageIndex: event.pageIndex));
  }

  void _onShowNavigationMenu(
    ShowNavigationMenu event,
    Emitter<NavigationMenuState> emit,
  ) {
    emit(state.copyWith(showNavigationMenu: event.showNavigationMenu));
  }
}
