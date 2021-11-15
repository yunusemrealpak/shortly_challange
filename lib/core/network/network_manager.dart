import 'package:dio/dio.dart';

import '../utils/config.dart';
import 'core_dio.dart';
import 'i_core_dio.dart';

class NetworkManager {
  static NetworkManager? _instance;

  static NetworkManager? get instance {
    if (_instance == null) _instance = NetworkManager._init();
    return _instance;
  }

  ICoreDio? coreDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: Config.baseUrl,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    );

    coreDio = CoreDio(baseOptions);
  }
}
