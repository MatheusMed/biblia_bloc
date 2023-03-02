// ignore_for_file: await_only_futures

import 'package:hive/hive.dart';

import '../../../domain/entities/all_books_entity.dart';

abstract class IHiveStorage {
  save(String key, valor);
  get(String key);
}

class HiveStorage implements IHiveStorage {
  @override
  save(String key, valor) async {
    Box box = await Hive.openBox('listaLivros');
    await box.put('listaOff', valor);
  }

  @override
  get(String key) async {
    Box box = await Hive.openBox('listaLivros');
    List<AllBooksEntity> lista = box.get('listaOff')!.cast<AllBooksEntity>();
    return lista;
  }
}
