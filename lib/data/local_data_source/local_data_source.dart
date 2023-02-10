import 'package:hive_flutter/hive_flutter.dart';

import 'local_data_keys.dart';

abstract class LocalDataSource {
  T? getValue<T>(LocalDataKeys key, {dynamic defaultValue});
  Future<void> setValue<T>(LocalDataKeys key, T value);
  Future<void> clear();
}

class LocalDataSourceImpl implements LocalDataSource {
  LocalDataSourceImpl(Box<dynamic> box) : _box = box;

  final Box<dynamic> _box;

  static Future<Box<dynamic>> init() async {
    await Hive.initFlutter();
    return Hive.openBox<dynamic>('defaultBox');
  }

  @override
  T? getValue<T>(LocalDataKeys key, {dynamic defaultValue}) {
    return _box.get(key.name, defaultValue: defaultValue) as T?;
  }

  @override
  Future<void> setValue<T>(LocalDataKeys key, T value) async {
    await _box.put(key.name, value);
  }

  @override
  Future<void> clear() async {
    await _box.clear();
  }
}
