import 'package:biblia_bloc/app/presenter/chapters/chapters_view.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/all_books_entity.dart';

class ListLivros extends StatelessWidget {
  final List<AllBooksEntity>? listaLivrros;
  const ListLivros({Key? key, required this.listaLivrros}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listaLivrros!.length,
      itemBuilder: (context, index) {
        var livro = listaLivrros?[index];
        return ListTile(
          title: Text(livro!.name!),
          trailing: Text(livro.group!),
          subtitle: Text('Capitulos  ${livro.chapters}'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChaptersView(bibliaEntity: livro),
                ));
          },
        );
      },
    );
  }
}
