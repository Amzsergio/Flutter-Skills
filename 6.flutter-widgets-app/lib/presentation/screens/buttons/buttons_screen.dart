import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {

  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.arrow_back_ios_new_rounded ),
        onPressed: (){
          context.pop();//Forma de devolerse con go_router **Routes
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,// width: double.infinity, el valor de esta propiedad de SizedBox () permite tomar todo el ancho posible, sin embargo, tener cuidado porque algunas veces puede generar error si no esta especificado el ancho del widget. **Widget **Style
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap( // Wrap funciona para que los elementos hijos no salgan de los limites del contendeor. **Widget https://www.youtube.com/watch?v=z5iw2SeFx2M&ab_channel=GoogleforDevelopers 
          
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [// !Buttons() Practicar los diferentes botones mostrados en la hoja de atajos **Practice **Widget 
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            const ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),
    
            ElevatedButton.icon(
              onPressed: (){}, 
              icon: const Icon( Icons.access_alarm_rounded), 
              label: const Text('Elevated Icon') 
            ),

            FilledButton(onPressed: (){}, child: const Text('Filled')),
            FilledButton.icon(
              onPressed: (){}, 
              icon: const Icon( Icons.accessibility_new ),
              label: const Text('Filled Icon'),
            ),

            OutlinedButton(onPressed: (){}, child: const Text('Outline')),
            OutlinedButton.icon(
              onPressed: (){}, 
              label: const Text('Outline Icon'),
              icon: const Icon( Icons.terminal)
            ),

            TextButton(onPressed: (){}, child: const Text('Text')),
            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon( Icons.account_box_outlined),
              label: const Text('Text Icon'),
            ),

            const CustomButton(),


            IconButton(onPressed: (){}, icon: const Icon( Icons.app_registration_rounded)),
            IconButton(
              onPressed: (){}, 
              icon: const Icon( Icons.app_registration_rounded),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white),
              ),
            ),

          ],
        ),
      ),
    );
  }
}


class CustomButton extends StatelessWidget {// Boton personalizado **Custom
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;


    return ClipRRect(// Sirve para cortar y hacer bordes redondeados ClipRRect, **Style **Widget
      borderRadius: BorderRadius.circular(20),
      child: Material( // Material me sirve para hacer diseños personalizados. **Style **Widget **Custom
      //!Intentar aplicar stilos creados en Toktik **Practice
        color: colors.primary,
        child: InkWell( // InkWell() aplica un efecto animado sobre el botón. **Animations **Style 
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric( horizontal: 20, vertical: 10),
            child: Text('Hola Mundo', style: TextStyle(color: Colors.white))
          ),
        ),
      ),
    );
  }
}

