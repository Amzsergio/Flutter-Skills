import 'package:cinemapedia/config/helpers/human_formats.dart'; // Dependencia par aformatos de
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

// ESta clase sirve para renderizar las peliculas horizontales y que se carguen progresivamente.
class MovieHorizontalListview extends StatefulWidget {
  // Esta clase se convierte en stateful porque necesito un Listener en el ListView **AppExp **Stf
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback?
      loadNextPage; // Esto va a funcionar para saber cuando llego al final y cargar mas películas pero es opcional porque puede que quiera hacerlo de tal forma que no quiero cargar mas páginas. **AppExp

  const MovieHorizontalListview(
      {super.key,
      required this.movies,
      this.title,
      this.subTitle,
      this.loadNextPage});

  @override
  State<MovieHorizontalListview> createState() =>
      _MovieHorizontalListviewState();
}

class _MovieHorizontalListviewState extends State<MovieHorizontalListview> {
  final scrollController =
      ScrollController(); // El controler permite reproducir e interactuar con el contenido. ScrollController() **Widget

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;

      if ((scrollController.position.pixels + 200) >=
          scrollController.position.maxScrollExtent) {
        // Condicional para determinar si llega a superar la condición máxima. **Slide
        widget
            .loadNextPage!(); // Es seguro que esto no va a ser null, debido a la linea anterior que condiciona la existencia delcall back loadNextPage.
      }
    });
  }

  @override
  void dispose() {
    scrollController
        .dispose(); // Siempre que se agrega un addListener, es necesario crear su dispose. **Stf
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (widget.title != null || widget.subTitle != null)
            _Title(title: widget.title, subTitle: widget.subTitle),
          Expanded(
              // Se usa expanded porque necesito que el listview tenga un tamaño específico. Expanded() listview() **Widget
              child: ListView.builder(
            // se usa ListView.builder cuando no se sabe la cantidad de widgets por renderizar. **Widget
            controller:
                scrollController, // Se asocia el scrollcontroller con el listview ScrollController() **Widget
            itemCount: widget.movies.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return FadeInRight(child: _Slide(movie: widget.movies[index]));
            },
          ))
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Imagen
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2)),
                    );
                  }
                  return FadeIn(child: child);
                },
              ),
            ),
          ),

          const SizedBox(height: 5),

          //* Title
          SizedBox(
            width: 150,
            child: Text(
              movie.title,
              maxLines: 2,
              style: textStyles.titleSmall,
            ),
          ),

          //* Rating
          SizedBox(
            //este sizeBox se crea para limitar el espacio del row, para no dejarle un ancho infinito y así poder crear el Spacer() SizedBox() Row() **Widget
            width: 150,
            child: Row(
              children: [
                Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
                const SizedBox(width: 3),
                Text('${movie.voteAverage}',
                    style: textStyles.bodyMedium
                        ?.copyWith(color: Colors.yellow.shade800)),
                const Spacer(),
                Text(HumanFormats.number(movie.popularity),
                    style: textStyles.bodySmall),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null) Text(title!, style: titleStyle),
          const Spacer(),
          if (subTitle != null)
            FilledButton.tonal(
                style: const ButtonStyle(visualDensity: VisualDensity.compact),
                onPressed: () {},
                child: Text(subTitle!))
        ],
      ),
    );
  }
}
