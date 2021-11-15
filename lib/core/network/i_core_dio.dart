
import '../enum/http_types.dart';
import 'result_model.dart';

abstract class ICoreDio {
  Future<ResultModel?> fetchNetwork(
    String path, {
    required HttpTypes type,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
}
