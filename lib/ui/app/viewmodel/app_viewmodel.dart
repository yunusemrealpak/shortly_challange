import 'package:clipboard/clipboard.dart';
import 'package:grisoft_url_shortening/core/base/base_viewmodel.dart';
import 'package:grisoft_url_shortening/core/cache/i_cache_manager.dart';
import 'package:grisoft_url_shortening/core/cache/link_cache_manager.dart';
import 'package:grisoft_url_shortening/core/constants/hive_constants.dart';
import 'package:grisoft_url_shortening/core/enum/notification_type.dart';
import 'package:grisoft_url_shortening/core/enum/types.dart';
import 'package:grisoft_url_shortening/model/shortly_link.dart';
import 'package:grisoft_url_shortening/ui/app/service/app_service.dart';

class AppViewModel extends BaseViewModel {
  final String _emptyErrorMessage = "Please add a link here";
  final String _defaultText = "Shorten a link here ...";

  AppService service = AppService();
  late ICacheManager _cacheManager;

  List<ShortlyLink> links = [];

  int copiedIndex = -1;
  bool showList = false;

  bool emptyError = false;
  String hintText = "";

  init() async {
    hintText = _defaultText;
    setState(ViewState.Busy);
    _cacheManager = LinkCacheManager(HiveConstants.linksBox);
    await _cacheManager.init();
    getLinks();
    setState(ViewState.Idle);
  }

  getLinks() {
    links = _cacheManager.getValues() ?? [];
    links = links.reversed.toList();
  }

  shortenTheLink(String url) async {
    setState(ViewState.Busy);
    var link = await service.shortenTheUrl(url);
    setState(ViewState.Idle);
    if (link == null) {
      showNotification(NotificationType.ERROR, "Hata oluştu. Tekrar deneyin");
      return;
    }
    await _cacheManager.setData(link);
    getLinks();
    showList = true;
    saveChanges();
  }

  copyShortLink(ShortlyLink link) async {
    var index = links.indexOf(link);
    await FlutterClipboard.copy(link.fullShortLink!);
    copiedIndex = index;
    saveChanges();
  }

  removeTheLink(ShortlyLink link) async {
    setState(ViewState.Busy);
    links.removeWhere((element) => element.code == link.code);
    await _cacheManager.clearAll();
    await _cacheManager.putAll(links);
    getLinks();
    setState(ViewState.Idle);
  }

  void setEmptyError() {
    emptyError = true;
    hintText = _emptyErrorMessage;
    saveChanges();
  }
}
