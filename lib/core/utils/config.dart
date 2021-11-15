import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String get baseUrl {
    var url = dotenv.env['BASE_URL'];
    return url!;
  }
}
