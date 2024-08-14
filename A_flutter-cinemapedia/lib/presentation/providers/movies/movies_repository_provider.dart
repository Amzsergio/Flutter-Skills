import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';

// Este repositorio es inmutable
//El objetivo es exponer globalmente  MovieRepositoryImpl para que los providers tengan acceso a él. En Main debo configurar el ProviderScope. **Riverpod
final movieRepositoryProvider = Provider((ref) {
  //Este provider es de sólo lectura, por ello es inmutable
  return MovieRepositoryImpl(MoviedbDatasource());
  // return MovieRepositoryImpl(IMDBDatasource()); //Esto sería en caso de que cambiemos de otro proveedor de información.
});
