import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';


class CounterScreen extends ConsumerWidget { // Esto funciona igual que el stateless widget pero tiene el WidgetRef, que es la referencia para el provider de Riverpod **Riverpod. 

  static const name = 'counter_screen';


  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clickCounter = ref.watch( counterProvider );// El watch esta pendiente del counterProvider para que se renderice. **Provider
    final bool isDarkmode = ref.watch( isDarkmodeProvider ); 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: Icon( isDarkmode ? Icons.dark_mode_outlined : Icons.light_mode_outlined ),
            onPressed: () {
              //ref.watch( isDarkmodeProvider );  //! No es buena práctica tener un watch n un método, porque aquí adentro no se dibuja nada, aquí necesitamos es un read. **Riverpod **BP
              ref.read( isDarkmodeProvider.notifier )//Se pone el .notifier para tener acceso al objeto, porque de lo contrario solo me hace la evaluación booleana es decir quedaría como true.update...**Riverpod 
                .update((state) => !state );
            }, 
          )
        ],
      ),

      body: Center(
        child: Text('Valor: $clickCounter', style: Theme.of(context).textTheme.titleLarge ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.add ),
        onPressed: (){
          // ref.read(counterProvider.notifier) 
          //   .update((state) => state + 1);//!Así También se lee y modifica el estado que viene del provider. **Riverpod
          ref.read( counterProvider.notifier ).state++;

        },
      ),
      
    );
  }
}


