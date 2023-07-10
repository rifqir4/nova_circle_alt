import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app_log.dart';

class AppEnv {
  AppEnv._();

  static Future<void> loadEnv() async {
    try {
      const path = '.env';
      await dotenv.load(fileName: path);
    } catch (e) {
      logg.e("Error load env");
    }
  }

  static String fromKey(String key) {
    try {
      return dotenv.env[key] ?? '';
    } catch (e) {
      logg.e('Error: $e');

      return '';
    }
  }

  static String get placesApiKey => fromKey('PLACES_API_KEY');
  static String get googleMapKey => fromKey('GOOGLE_MAPS_KEY');
}
