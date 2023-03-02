// ignore_for_file: await_only_futures

import 'package:hive/hive.dart';

import '../../../domain/entities/all_books_entity.dart';

abstract class IHiveStorage {
  save(String key, valor);
  get(String key);
}

class HiveStorage implements IHiveStorage {
  final box = Hive.box<List<AllBooksEntity>>('listaLivros');

  @override
  save(String key, valor) async {
    return await box.put(key, valor);
  }

  @override
  get(String key) {
    return box.get(key);
  }
}
