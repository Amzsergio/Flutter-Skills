import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

// El mapper funciona para que yo pueda crear un Json y basarse en cualquier tipo ode dato y no solo de moviedb, por ejemplo si en algun momento en la api se cambian los nombres, entonces aquí podemos sencillamente a cambiar el nombre de donde se toma la data. (En resumne esto es una capa de protección con la api que viene de afuera) **Ctaxi **Mappers
class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
          : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg', // ESte link viene de la doc de moviedb donde se solicita las imagenes, y despuesl el backdropPath es la segunda parte del link. **AppExp
      genreIds: moviedb.genreIds
          .map((e) => e.toString())
          .toList(), // Transformar enteros en strings. **Dart **AppExp
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != '')
          ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
          : 'no-poster', // ESte link viene de la doc de moviedb donde se solicita los posters, y despuesl el backdropPath es la segunda parte del link. **AppExp
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount);
}
