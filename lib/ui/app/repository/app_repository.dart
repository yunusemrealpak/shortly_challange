import 'package:grisoft_url_shortening/core/enum/http_types.dart';
import 'package:grisoft_url_shortening/core/network/network_paths.dart';
import 'package:grisoft_url_shortening/core/network/result_model.dart';
import 'package:grisoft_url_shortening/ui/app/repository/i_app_repository.dart';

class AppRepository extends IAppRepository {
  @override
  Future<ResultModel?> shortenTheUrl(String url) async {
    return await coreDio!.fetchNetwork(
      NetworkPaths.SHORTEN,
      type: HttpTypes.GET,
      queryParameters: {
        "url": url,
      },
    );
  }
}
