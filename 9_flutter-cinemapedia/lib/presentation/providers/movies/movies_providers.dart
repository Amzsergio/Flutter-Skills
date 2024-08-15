import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref
      .watch(
          movieRepositoryProvider) // Aquí se deja watch en lugar de read, porque es la recomendación de **Riverpod por si algún día se cambia.
      .getNowPlaying; // Esto es para traer el callback de la referencia que se encuentra en MovieRepositoryImpl

  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

typedef MovieCallback = Future<List<Movie>> Function(
    {int page}); // Esto sirve para definir el caso de uso. **AppExp

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage =
      0; // Este page viene de la api, donde cada page es la información de una movie diferente **Arch **AppExp
  MovieCallback fetchMoreMovies;

  MoviesNotifier({
    required this.fetchMoreMovies,
  }) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
  }
}
