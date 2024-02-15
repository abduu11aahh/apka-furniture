import 'package:bloc/bloc.dart';
import 'package:Apka_Furniture/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:Apka_Furniture/presentation/seller_home_screen/seller_home_screen.dart';

class SellerBottomBarState {
  final int currentTab;
  final Widget currentScreen;

  SellerBottomBarState({required this.currentTab, required this.currentScreen});
}

class SellerBottomBarCubit extends Cubit<SellerBottomBarState> {
  SellerBottomBarCubit()
      : super(SellerBottomBarState(
            currentTab: 0, currentScreen: SellerHomeScreen()));

  void setCurrentTab(int tab, Widget screen) {
    emit(SellerBottomBarState(currentTab: tab, currentScreen: screen));
  }
}
