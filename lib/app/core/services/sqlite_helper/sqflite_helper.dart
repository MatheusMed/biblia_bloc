// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  // construtor com acesso privado
  DB._();
  // criar uma instancia do DB
  static final DB instance = DB._();

  // instanciando o sqlite
  static Database? _database;

  // verficicando se ja existe a database se nao inicia uma nova
  get database async {
    if (_database != null) return _database;

    return await _initDatase();
  }

  Future<Database> _initDatase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'Pessoa.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      ''' 
      CREATE TABLE bibila(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nome TEXT,
          altura TEXT,
          peso TEXT
      );
    ''',
    );
  }
}
