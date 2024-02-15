import 'package:bloc/bloc.dart';
import 'package:Apka_Furniture/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:Apka_Furniture/presentation/user_home_screen/user_home_screen.dart';

class BottomBarState {
  final int currentTab;
  final Widget currentScreen;

  BottomBarState({required this.currentTab, required this.currentScreen});
}

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit()
      : super(BottomBarState(currentTab: 0, currentScreen: UserHomeScreen()));

  void setCurrentTab(int tab, Widget screen) {
    emit(BottomBarState(currentTab: tab, currentScreen: screen));
  }
}
