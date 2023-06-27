
import 'package:go_router/go_router.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

import '../../features/Employ/view/employ_screen.dart';
import '../../features/welcome/splash.dart';

final router = GoRouter(
  initialLocation: '/',
  observers: [
    NavigationHistoryObserver(),
  ],
  routes: [
    GoRoute(
      path: '/',
      name: 'SplashScreen',
      builder: (context, state) => const Splash(),
    ),
    GoRoute(
      path: '/employee_list',
      name: 'EmployeeListScreen',
      builder: (context, state) => const EmployeeListScreen(),
    ),
    //
    //
    // GoRoute(
    //   path: DeepLinkTrackingScreen.routeName,
    //   name: 'DeepLinkTrackingScreen',
    //   builder: (context, state) => DeepLinkTrackingScreen(
    //     refferalId: state.queryParams['refId']?.toString(),
    //   ),
    // ),
    //
    // GoRoute(
    //   path: '/error_screen',
    //   name: 'ErrorScreen',
    //   builder: (context, state) => ErrorScreen(
    //     errorTitle: state.extra?.toString(),
    //   ),
    // ),
    // GoRoute(
    //   path: '/thanks_screen',
    //   name: 'ThankYouScreen',
    //   builder: (context, state) => ThankYouScreen(
    //     errorTitle: state.extra?.toString(),
    //   ),
    // ),


  ],
  // errorBuilder: (context, state) => RedirectOnErrorScreen(routerState: state),
);
