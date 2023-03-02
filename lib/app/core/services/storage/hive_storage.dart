// ignore_for_file: await_only_futures

import 'package:biblia_bloc/app/domain/entities/verses_entity.dart';
import 'package:hive/hive.dart';

import '../../../domain/entities/all_books_entity.dart';
import '../../../domain/entities/biblia_entity.dart';

abstract class IHiveStorage {
  saveListLivros(String key, valor);
  getLislivrros(String key);
  save(String key, valor);
  get(String key);
}

class HiveStorage implements IHiveStorage {
  @override
  saveListLivros(String key, valor) async {
    Box box = await Hive.openBox('listaLivros');
    await box.put(key, valor);
  }

  @override
  getLislivrros(String key) async {
    Box box = await Hive.openBox('listaLivros');
    List<AllBooksEntity> lista = box.get(key)!.cast<AllBooksEntity>();
    return lista;
  }

  @override
  get(String key) async {
    Box box = await Hive.openBox('livro');
    List<VersesEntity> lista = box.get('livroOff')!.cast<VersesEntity>();
    return lista;
  }

  @override
  save(String key, valor) async {
    Box box = await Hive.openBox('livro');
    await box.put('livroOff', valor);
  }
}
