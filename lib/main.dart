import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:smile_temp/config/resources/AppContextExtension.dart';
import 'package:smile_temp/utils/services/alert_service/alert_service.dart';
import 'config/providers/root_providers.dart';
import 'config/serviceLocator/serviceLocatorRegistory.dart';

Future<void> main() async {
  await dotenv.load();
  await setUp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = serviceLocator<GoRouter>();

    return MultiProvider(

      ///provider initializing
      providers: providers,
      child: OverlaySupport.global(
        child:  MaterialApp.router(
          scaffoldMessengerKey: globalSnackbarKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: context.resources.color.colorPrimary,
          ),
          builder: (context, myWidget) {
            myWidget = EasyLoading.init()(context, myWidget);
            return MediaQuery(
              child: myWidget,
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.0,
                highContrast: false,
              ),
            );
            // return myWidget;
          },

          routerDelegate: appRouter.routerDelegate,
          routeInformationProvider: appRouter.routeInformationProvider,
          routeInformationParser: appRouter.routeInformationParser,
        ),
      ),
    );
  }
}