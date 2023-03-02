import 'package:biblia_bloc/app/domain/entities/all_books_entity.dart';
import 'package:biblia_bloc/app/domain/entities/biblia_entity.dart';
import 'package:biblia_bloc/app/domain/entities/book_entity.dart';
import 'package:biblia_bloc/app/domain/entities/chapter_entity.dart';
import 'package:biblia_bloc/app/domain/entities/verses_entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/abbrev_entity.dart';

class HiveConfig {
  static Future init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AbbrevEntityAdapter());
    Hive.registerAdapter(AllBooksEntityAdapter());
    Hive.registerAdapter(BibliaEntityAdapter());
    Hive.registerAdapter(BookEntityAdapter());
    Hive.registerAdapter(ChapterEntityAdapter());
    Hive.registerAdapter(VersesEntityAdapter());
  }
}
