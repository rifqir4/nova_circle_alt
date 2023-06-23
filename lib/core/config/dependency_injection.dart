import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './storage.dart';
import './flavor_config.dart';

final GetIt di = GetIt.instance;

Future<void> initStorage() async {
  final sharedPref = await SharedPreferences.getInstance();
  di.registerLazySingleton<Storage>(() => Storage(sharedPref));
}

Future<void> initFlavorConfig(FlavorConfig flavorConfig) async {
  di.registerFactory<FlavorConfig>(() => flavorConfig);
}
