import 'package:biblia_bloc/app/presenter/home/bloc/home_bloc.dart';
import 'package:biblia_bloc/app/presenter/home/widgets/list_livros.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'bloc/home_state.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = GetIt.I.get<HomeBloc>();

  @override
  void initState() {
    super.initState();
    controller.getAllLivros();
  }

  @override
  void dispose() {
    super.dispose();
    controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Livros'),
        elevation: 4,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: controller,
        builder: (context, state) {
          switch (state.homeStatus) {
            case HomeStatus.initial:
              return const SizedBox();
            case HomeStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case HomeStatus.sucess:
              return ListLivros(listaLivrros: state.listaLivrros);
            case HomeStatus.error:
              return const Center(child: Text('Error ao execultar'));
          }
        },
      ),
    );
  }
}
