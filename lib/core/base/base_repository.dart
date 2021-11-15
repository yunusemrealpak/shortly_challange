import '../network/i_core_dio.dart';
import '../network/network_manager.dart';

abstract class BaseRepository {
  ICoreDio? coreDio = NetworkManager.instance!.coreDio;
}
