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
    links.sort((a,b) => b.createdDate!.compareTo(a.createdDate!));
  }

  shortenTheLink(String url) async {
    setState(ViewState.Busy);
    var res = await service.shortenTheUrl(url);
    setState(ViewState.Idle);
    if (res.hasError ?? false) {
      showNotification(NotificationType.ERROR, res.errorMessage??"");
      return;
    }
    await linkAlreadyExists(res.link!);
    await _cacheManager.setData(res.link);
    getLinks();
    setEmptyError(false);
    showList = true;
    saveChanges();
  }
  
  linkAlreadyExists(ShortlyLink link) async {
    var index = links.indexWhere((element) => element.code == link.code);
    var exist = index != -1;
    
    if(exist) {
      links.removeWhere((element) => element.code == link.code);
      await updateCacheAll();
    } 
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
    await updateCacheAll();
    getLinks();
    setState(ViewState.Idle);
  }
  
  updateCacheAll() async {
    await _cacheManager.clearAll();
    await _cacheManager.putAll(links);
  }

  void setEmptyError(bool val) {
    emptyError = val;
    hintText = val ? _emptyErrorMessage : _defaultText;
    saveChanges();
  }
}
