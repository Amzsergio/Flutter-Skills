import 'package:animate_do/animate_do.dart'; // Dependencia para animar. **Tools
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart'; // Esto es una dependencia para mostrar cartas que se deslizan **Tools **Ctaxi
import 'package:cinemapedia/domain/entities/movie.dart';

class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;

  const MoviesSlideshow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 210, // Un valor arbitrario **AppExp
      width: double.infinity, // Para que tome todo el ancho posible **Style
      child: Swiper(
        viewportFraction:
            0.8, // Ver slide anterio y siguiente **Style **Widget Swiper()
        scale: 0.9,
        autoplay: true,
        pagination: SwiperPagination(
            margin: const EdgeInsets.only(top: 0),
            builder: DotSwiperPaginationBuilder(
                activeColor: colors.primary, color: colors.secondary)),
        itemCount: movies.length,
        itemBuilder: (context, index) =>
            _Slide(movie: movies[index]), // Esto es lo mismo que:
        // itemBuilder: (context, index) {
        //   final movie = movies[index];
        //   return _Slide(movie: movie);
        // }
        // o también
        // itemBuilder: (context, index) {
        //   return _Slide(movie: movies[index]);
        // } **Syntx
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.black45, blurRadius: 10, offset: Offset(0, 10))
        ]); //Practicar estos estilos **Practice

    return Padding(
      padding: const EdgeInsets.only(
          bottom:
              30), // Esto es para dejar espacio para renderizar los puntos. **Style
      child: DecoratedBox(
          decoration: decoration,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.backdropPath,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  //el loadingBuilder nos ayuda a saber cuando la imagen se xonstruyo o no. **Style **Widget Image.network()
                  if (loadingProgress != null) {
                    return const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.black12));
                  }
                  return FadeIn(
                      child:
                          child); // Viene de la dependencia animate_do para que entre suave el slide.  **Animation **AppExp
                },
              ))),
    );
  }
}
