
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../data/remote/network/BaseApiService.dart';
import '../data/remote/network/NetworkApiService.dart';
import '../routers/routers.dart';

final serviceLocator = GetIt.instance;

Future<void> setUp() async {
  serviceLocator.registerLazySingleton<GoRouter>(() => router);
  serviceLocator.registerLazySingleton<BaseApiService>(() => NetworkApiService());

}