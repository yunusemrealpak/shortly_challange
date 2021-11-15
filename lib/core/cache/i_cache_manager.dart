import 'package:grisoft_url_shortening/model/shortly_link.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class ICacheManager<T> {
  final String key;
  Box<ShortlyLink>? _box;
  Box<ShortlyLink>? get box => _box;
  
  ICacheManager(this.key);
  
  Future<void> init() async {
    registerAdapters();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(key);
    }
  }
  Future<void> setData(T data);
  Future<void> putAll(List<T> items);
  List<ShortlyLink>? getValues();
  Future<void> removeItem(String key);
  Future<void> clearAll() async {
    await _box?.clear();
  }
  
  void registerAdapters();
}