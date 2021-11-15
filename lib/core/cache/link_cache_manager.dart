import 'package:grisoft_url_shortening/core/constants/hive_constants.dart';
import 'package:grisoft_url_shortening/model/shortly_link.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'i_cache_manager.dart';

class LinkCacheManager extends ICacheManager<ShortlyLink> {
  LinkCacheManager(String key) : super(key);

  @override
  List<ShortlyLink>? getValues() {
    return box?.values.toList();
  }

  @override
  Future<void> setData(ShortlyLink data) async {
    await box?.add(data);
  }

  @override
  Future<void> removeItem(String key) async {
    await box?.delete(key);
  }

  @override
  Future<void> putAll(List<ShortlyLink> items) async {
    await box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.code, e))));
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.shortlyLinkId)) {
      Hive.registerAdapter(ShortlyLinkAdapter());
    }
  }
}
