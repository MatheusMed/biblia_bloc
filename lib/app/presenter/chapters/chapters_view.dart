import 'package:biblia_bloc/app/presenter/chapters/widgets/chapters_list.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/all_books_entity.dart';

class ChaptersView extends StatelessWidget {
  final AllBooksEntity bibliaEntity;
  const ChaptersView({Key? key, required this.bibliaEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> lista = List.generate(bibliaEntity.chapters!, (i) {
      var item = i + 1;
      return InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChaptersList(
                  charpts: item,
                  abbrev: bibliaEntity.abbrev!.pt!,
                  author: bibliaEntity.author!,
                ),
              ));
        },
        child: Card(
          child: ListTile(
            title: Center(child: Text(item.toString())),
          ),
        ),
      );
    });

    return Scaffold(
        appBar: AppBar(
          title: Text(bibliaEntity.name!),
        ),
        body: GridView(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2),
          shrinkWrap: true,
          children: lista,
        ));
  }
}
