import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:smile_temp/config/resources/AppContextExtension.dart';
import '../../config/serviceLocator/serviceLocatorRegistory.dart';
import '../../utils/services/internet_connectivity/internet_connectivity_provider.dart';
import '../../utils/services/internet_connectivity/show_connectivity_alerts.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  late StreamSubscription connectionStream;

  @override
  void initState() {
    connectionStream = Connectivity().onConnectivityChanged.listen(showConnectivityAlerts);
    Future.delayed(Duration(seconds: 3), () {
      serviceLocator<GoRouter>().pushReplacement('/employee_list');
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final internetConnectivityProvider = Provider.of<InternetConnectivityProvider>(context);
    internetConnectivityProvider.startMonitoring(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.resources.color.primaryBackground,
      body: Column(
        children: [
          Spacer(),
          Text(context.resources.strings.welcome,style: context.resources.textStyle.heading1,),
          Spacer(),
          Lottie.asset('assets/lotties/splash-loading.json',),
          Spacer(),
        ],
      ),
    );
  }
}
