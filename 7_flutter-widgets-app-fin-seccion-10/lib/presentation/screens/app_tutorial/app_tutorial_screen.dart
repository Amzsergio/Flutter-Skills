import 'package:animate_do/animate_do.dart'; // Animate do instalar como dependencia **Tools **AppExp
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//Es un App tutorial para explicar en que consiste la app. **Ctaxi

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Exercitation voluptate cillum eu aute dolor irure aliquip.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rápida',
      'Ullamco ullamco duis labore quis occaecat culpa laborum id incididunt.',
      'assets/images/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Ea officia exercitation voluptate nostrud amet esse ut exercitation deserunt est enim est.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  // Se deja statefull para poder tener el controller pageviewController de PageController **AppExp **Widget

  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageviewController = PageController();
  bool endReached = false;// Bandera booleana para mostrar el botón en la última pantall. **AppExp

  @override
  void initState() {
    super.initState();
    pageviewController.addListener(() {
    // print('${ pageviewController.page }' ); //! Esta línea imprime un valor continuo que se renderiza de acuerdo al tiempo de refresh de cada dispositivo con los valores continuos (0.154534, 0.17534  ... ) que inician en 0 siendo la primera página y continuado con el 1 para la siguiente y así sucesivamente. PageController() **Widget
      final page = pageviewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) { // El -1.5 en lugar de 1 es porque quiero que se me renderice el botón cuando ya este a mitad de la transición entre la penultima y la última página. 
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageviewController.dispose(); // Siempre que se usa un controller es cuena práctica llamar al dispose del controller PageController() **BP **Widget

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors
          .white, // Es para e el color de fondo concuerde con la paleta de colores **AppExp
      body: Stack(
        // Este stack se crea para poder crear el botón posicionado. STACK **Widget **Button
        children: [
          PageView(
            // PageView para pantallas enteras **Widget
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(), // Convertir los Slides en List **AppExp
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text('Salir'),
                onPressed: () => context.pop(),
              )),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(// Animación que viene de la dependencia de Animate do **Tools **Animation 
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text('Comenzar'),
                    ),
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .titleLarge; // Opción de manejar tamaños de la letra **Style **Ctaxi
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, //Centrar en el sentido vertical **Style
          crossAxisAlignment: CrossAxisAlignment
              .start, // Posición en el sentido horizontal **Style
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(height: 10),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
