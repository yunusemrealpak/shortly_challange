import 'package:grisoft_url_shortening/core/cache/i_cache_manager.dart';
import 'package:grisoft_url_shortening/core/cache/link_cache_manager.dart';

abstract class BaseService {
  late ICacheManager _cacheManager;
  ICacheManager get cacheManager => _cacheManager;
  
  String key;
  
  BaseService(this.key) {
    _cacheManager = LinkCacheManager(key);
  }
}
