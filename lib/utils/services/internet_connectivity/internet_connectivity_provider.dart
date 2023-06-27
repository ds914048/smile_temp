import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

class InternetConnectivityProvider with ChangeNotifier {
  final Connectivity _connectivity = Connectivity();
  bool _isOnline = true;
  RouteSettings? lastRouteSettings;
  List<Route> history = [];
  bool get isOnline => _isOnline;

  Future<void> startMonitoring(BuildContext context) async {
    await isItConnectivity();
    _connectivity.onConnectivityChanged.listen((result) async {
      if (result == ConnectivityResult.none) {
        _isOnline = false;
        notifyListeners();
      } else {
        // await _updateConnectionStatus().then((isConnected) {
        //   _isOnline = isConnected;
        //   notifyListeners();
        //   // if(check>1)
        //   // showSimpleNotification(
        //   //     Text("Good to go you are connected with internet now"),
        //   //     background: Colors.green);
        //   // notifyListeners();
        // });
      }
    });
  }

  void cacheRouteSetting(RouteSettings settings) {
    lastRouteSettings = settings;
  }

  void setRouteHistory(RouteSettings settings) {
    history = NavigationHistoryObserver().history.asList();
  }

  // hit this when user clicks the retry button
  Future<void> updateConnectivity() async {
    await _updateConnectionStatus().then((isConnected) {
      if (!isConnected) {
        return;
      }

      _isOnline = isConnected;
      notifyListeners();
      // if(check>1)
      // showSimpleNotification(
      //     Text("Good to go you are connected with internet now"),
      //     background: Colors.green);
      // notifyListeners();
    });
  }

  Future<void> isItConnectivity() async {
    try {
      final status = await _connectivity.checkConnectivity();
      if (status == ConnectivityResult.none) {
        _isOnline = false;
        notifyListeners();
      } else {
        _isOnline = true;
        notifyListeners();
      }
    } on PlatformException catch (e) {
      print('PlatformException InternetConnectivityProvider $e');
    }
  }

  Future<bool> _updateConnectionStatus() async {
    bool isConnected;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      } else {
        isConnected = false;
      }
      return isConnected;
    } on SocketException catch (_) {
      isConnected = false;
      return isConnected;
    }
  }
}
