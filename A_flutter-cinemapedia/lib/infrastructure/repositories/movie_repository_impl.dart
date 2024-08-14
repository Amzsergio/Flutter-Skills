import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

// En algunos casos, personas pueden llamar esta carpeta como moviedb_datasource_implementation. **Arch

//Esta clase es importante para que yo pueda cambiar facilmente el origen de los datos, pero cuando esté con los providers de riverpod se llama la implementación MovieRepositoryImpl y ya tiene el datasource, y facilmente llama el mecanismo de la funcionalidad. (En resumen, podemos llamar facilmente getNowPlaying basados en el datasource) **Riverpod **Arch **AppExp

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource; // Origen de los datos.
  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    // Mecanismo de la funcionalidad.
    return datasource.getNowPlaying(page: page);
  }
}
