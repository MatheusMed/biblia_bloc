import '../../../domain/entities/all_books_entity.dart';

enum HomeStatus { initial, loading, sucess, error }

class HomeState {
  List<AllBooksEntity>? listaLivrros;
  HomeStatus homeStatus;
  HomeState({
    this.listaLivrros,
    this.homeStatus = HomeStatus.initial,
  });

  HomeState copyWith({
    List<AllBooksEntity>? listaLivrros,
    HomeStatus? homeStatus,
  }) {
    return HomeState(
      listaLivrros: listaLivrros ?? this.listaLivrros,
      homeStatus: homeStatus ?? this.homeStatus,
    );
  }
}
