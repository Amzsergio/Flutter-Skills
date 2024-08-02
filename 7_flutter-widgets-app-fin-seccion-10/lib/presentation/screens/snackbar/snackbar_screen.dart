import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//Los SnackBar son mensajes de respuesta en la app que aparecen usualmente en la parte inferior de la pantalla. Los snackBar se muestran a través de renderizar un scaffold. **Snack
class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar( BuildContext context ) {// Es el BuildContext el que me permite mover ScaffoldMessenger y Snackbar a esta función void, explicar porqué. (Porque necesita la dependencia de el SnackBar) **Practice **SnackBar

    ScaffoldMessenger.of(context).clearSnackBars();// ESta línea es para permitir que el snackBar anterior se limpie una vez genero un nuevo snackBar, con ello evito una cola de snackBars. 

    final snakback = SnackBar(// POracticar con más propiedades de SnackBar **SnackBar **Widget
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snakback);

  }

  void openDialog( BuildContext context ) {// Este es un dialogo personalizado **Custom ** SnackBar

    showDialog( // Practicar dialogos y sus propiedades **Practice 
      context: context, 
      barrierDismissible: false, // Si no confirma no puede cerrar el dialogo
      builder: (context) => AlertDialog( 
        title: const Text('¿Estás seguro?'),
        content: const Text('Ex sit ea est in. Aliqua cillum amet tempor id officia tempor adipisicing amet commodo aliqua. Ut eiusmod cillum nulla sit ut non minim laboris cupidatat exercitation minim magna pariatur est. Nisi aute ea id enim sint occaecat aute adipisicing duis qui nisi. Nulla cillum nulla eiusmod enim magna sint eu dolor occaecat cupidatat.'),
        actions: [
          TextButton( onPressed: ()=> context.pop(), child: const Text('Cancelar')),
          
          FilledButton( onPressed: ()=> context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            FilledButton.tonal(// parcticar con este botón **Practice **Button
              onPressed: (){
                showAboutDialog( //Mostrar dialogo sobre las licencias que se están usando **Practice **Style **Ctaxi
                  context: context,
                  children: [
                    const Text('Aute amet dolore ipsum ex adipisicing incididunt pariatur eiusmod ipsum duis voluptate commodo qui. Non anim nulla enim do sunt minim anim sit nostrud sunt. Ex culpa ipsum voluptate ut qui Lorem ad. Consequat dolor duis nulla ipsum ea. Nostrud nulla nulla ad pariatur ullamco cupidatat aliquip irure dolore amet deserunt nulla veniam. Id ut duis nulla in commodo elit. Laboris ea ipsum aute excepteur quis magna elit est incididunt veniam deserunt ad veniam.')
                  ]
                );
              }, child: const Text('Licencias usadas')),

            FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text('Mostrar diálogo'))
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon( Icons.remove_red_eye_outlined ),
        onPressed: () => showCustomSnackbar(context), // Aquí envío el context al SnackBar **SnackBar
      ),
    );
  }
}