import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

import 'movies_providers.dart';

// Este provider es para identificar las películas que se están renderizando en mi Slide **Ctaxi **Riverpod

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(
      nowPlayingMoviesProvider); // Esto es un provider de solo lectura **Provider

  if (nowPlayingMovies.isEmpty) return [];
// esta condición es para que no se genere un error en la app, es decir mientras se hace la petición y no hay movies se retorna una lista vacia, y cuando ya carguen las peliculas entonces si envío la sublista de 0 a 6 o la cantidad de películas que quiero mostrar. **AppExp **Riverpod

  return nowPlayingMovies.sublist(0, 6);
});
