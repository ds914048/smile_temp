import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../alert_service/alert_service.dart';

import '../../../config/serviceLocator/serviceLocatorRegistory.dart';



void showConnectivityAlerts(event) {
  //TODO: Check how to avoid race condition when app starts
  if (serviceLocator<GoRouter>().location == '/') {
    return;
  }
  if (event == ConnectivityResult.none) {
    // show connection lost banner
    AlertService.show(
        bannerTitle: 'Offline',
        text: 'Your network is unavailable. Please check your data or wifi connection',
        bannerIcon: Icons.cloud_off_outlined,
        bannerIconColor: Colors.redAccent,
        type: AlertType.banner,
        onRetry: () {
          AlertService.hide();
        });
  } else {
    // remove the banner
    //   AlertService.show(
    //   bannerTitle: 'Online',
    //   text: 'You\'re back online',
    //   bannerIcon: Icons.cloud_outlined,
    //   bannerIconColor: Colors.green,
    //   type: AlertType.banner,
    //   onRetry: () {

    //   final routeHistoryReversed = NavigationHistoryObserver()
    //   .history
    //   .toList();

    // if (routeHistoryReversed.isNotEmpty) {
    //     for(final route in  routeHistoryReversed) {
    //       logger.i(route.settings.name);
    //       sl<GoRouter>().pushReplacementNamed(route.settings.name!, extra: route.settings.arguments);
    //     }
    // }

    //   AlertService.hide();
    //   }
    // );
  }
}
