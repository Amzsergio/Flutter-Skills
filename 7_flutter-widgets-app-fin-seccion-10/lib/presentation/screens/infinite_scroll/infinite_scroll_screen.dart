// import 'dart:js_interop';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Scroll que llama las imagenes o su contenido cuando se rendericen una cantidad especifica de elementos. ListView.builder **Ctaxi **Widget
class InfiniteScrollScreen extends StatefulWidget {
  //Se cambia a statefulWidget por que es necesario para el itemcount del ListviewBuilder. **AppExp

  static const name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false; // Para saber si estacargando las nuevas 5 imgenes.
  bool isMounted =
      true; // Para validar si esta montado el widget, entonces cuando se acaba la renderización debemos descativarlo en el dispose. **Ctaxi **Mounted

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        // scrollController.position.pixels es la posición presente y crollController.position.maxScrollExtent es la posición máxima a la que puedo extender.
        // Load next page
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted =
        false; // Para setear nuevamente a false el isMounted **Ctaxi **Mounted
    super.dispose();
  }

  Future loadNextPage() async {
// Código sync
    if (isLoading) return;
    isLoading = true;
    setState(() {});
// Código sync

    await Future.delayed(const Duration(seconds: 2));
// Código Async por la línea anterior

    addFiveImages();
    isLoading = false;

    if (!isMounted) return; // Se hace la revisión del mounted aquí porque ya el código no es sólo sync sino tambien Asyn, cada uno de los pasos donde es async y llamamos a set State, es donde debemos verificar si estamos montados. **Ctaxi **Mounted **Practice

    setState(() {});
    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;// Mounted **Mounted

    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    setState(() {});
  }

  void moveScrollToBottom() {// Esta función es para que automáticamente se mueva el scroll cuando llegue al final del mismo y muestre que hay mas contenido enseguida. **Widget
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  void addFiveImages() {
    // Esto se hace para cargar cinco imagenes **AppExp
    final lastId = imagesIds.last;

    // imagesIds.add( lastId + 1);
    // imagesIds.add( lastId + 2);
    // imagesIds.add( lastId + 3);
    // imagesIds.add( lastId + 4);
    // imagesIds.add( lastId + 5);
    //! Esta linea es sinonimo del codigo comentado en las anteriores lineas.
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        // Esto es para remover espacio de arriba en la pantalla. MediaQuery.removePadding() **MediaQuery **Widget **Style
        context: context,
        removeTop: true,
        removeBottom:
            true, // Esto es para remover espacio de abajo en la pantalla. MediaQuery.removePadding() **MediaQuery **Widget **Style
        child: RefreshIndicator(// RefreshIndicator , este widdget es para hacer refresh haciendo slide hasta que se exceda la parte superior de la pantalla. **Ctaxi **Loader
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                // Permite cargar la imagen y mientras mostrar el placeholder. ListView.builder **Animations **Widget
                fit: BoxFit.cover, // Toma el espacion que tiene.
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage(
                    'assets/images/jar-loading.gif'), // Cargar imagen local **Widget **Style **-Images
                image: NetworkImage(
                    'https://picsum.photos/id/${imagesIds[index]}/500/300'), //Los últimos dos parametros del link son altura y ancho **Images **Widget
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        // child: const Icon(Icons.arrow_back_ios_new_outlined),
        // child: CircularProgressIndicator(); //Una posible forma de indicar que está cargando nuevas imágenes. ListView **Widget
        child: isLoading
            ? SpinPerfect( // Esto lo puedo hacer para el loader de las cards en Ctaxi. **Loader **Ctaxi **Practice
                infinite: true, child: const Icon(Icons.refresh_rounded))
            : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),// esto es para hacer la animación **Animation
      ),
    );
  }
}
