import 'package:biblia_bloc/app/presenter/chapters/bloc/chapters_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bloc/chapters_state.dart';

class ChaptersList extends StatefulWidget {
  final int charpts;
  final String abbrev;
  final String author;
  const ChaptersList(
      {Key? key,
      required this.charpts,
      required this.abbrev,
      required this.author})
      : super(key: key);

  @override
  State<ChaptersList> createState() => _ChaptersListState();
}

class _ChaptersListState extends State<ChaptersList> {
  final controller = GetIt.I.get<ChaptersBloc>();

  @override
  void initState() {
    controller.getCharpter(widget.abbrev, widget.charpts);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Autor ${widget.author}'),
        ),
        body: BlocBuilder<ChaptersBloc, ChaptersState>(
          bloc: controller,
          builder: (context, state) {
            switch (state.status) {
              case ChaptersStatus.initial:
                return const SizedBox();

              case ChaptersStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ChaptersStatus.sucess:
                return ListView.builder(
                  itemCount: state.bibliaEntity!.verses!.length,
                  itemBuilder: (context, index) {
                    var verser = state.bibliaEntity!.verses![index];
                    return ListTile(
                      title: Text('${verser.number!} - ${verser.text!}'),
                    );
                  },
                );
              case ChaptersStatus.error:
                return const Center(child: Text('Error ao fazer a requisicao'));
            }
          },
        ));
  }
}