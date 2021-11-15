import 'package:grisoft_url_shortening/core/base/base_repository.dart';
import 'package:grisoft_url_shortening/core/network/result_model.dart';

abstract class IAppRepository extends BaseRepository {
  Future<ResultModel?> shortenTheUrl(String url);
}