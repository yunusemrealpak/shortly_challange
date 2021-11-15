import 'package:grisoft_url_shortening/core/base/base_service.dart';
import 'package:grisoft_url_shortening/core/constants/hive_constants.dart';
import 'package:grisoft_url_shortening/model/shortly_link.dart';
import 'package:grisoft_url_shortening/ui/app/repository/app_repository.dart';
import 'package:grisoft_url_shortening/ui/app/repository/i_app_repository.dart';

class AppService extends BaseService {
  late IAppRepository repo;

  AppService() : super(HiveConstants.linksBox) {
    repo = AppRepository();
  }

  Future<ShortlyLink?> shortenTheUrl(String url) async {
    var response = await repo.shortenTheUrl(url);

    switch (response!.resultCode) {
      case 1:
        var res = response.resultData["ok"];
        if (res) {
          var link = ShortlyLink.fromJson(response.resultData["result"]);
          //cacheManager.setData(link);

          return link;
        }
        return null;
      default:
        return null;
    }
  }
}
