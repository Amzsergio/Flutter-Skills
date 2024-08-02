import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Instalar dependencia de go_router, esto es para mejorar la experiencia de routes **Tools**Routes
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';
// import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';



class HomeScreen extends StatelessWidget {

  static const String name = 'home_screen'; // Es estatico para no tener que instanciar para acceder a él, esto se hace para definir las routas con name. **Practice ¿Cuál es la diferencia de no usarlo con name? **Routes

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
      drawer: SideMenu( scaffoldKey: scaffoldKey )
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {


    return ListView.builder(// practice different properties, incluyendo ListTile() **Practice **Widget ListView.builder
      itemCount: appMenuItems.length,// Este item count es necesario para que no se desborde el arreglo en el itemBuilder
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];

        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    
    return ListTile(
      leading: Icon( menuItem.icon, color: colors.primary ),
      trailing: Icon( Icons.arrow_forward_ios_rounded, color:colors.primary ),
      title: Text(menuItem.title),
      subtitle: Text( menuItem.subTitle ),
      onTap: () {
        //!Este tipo de navegación es común encontrarla sin embargo desde la misma página de flutter no se recomienda por sus limitaciones ** Routes **Practice ver cuales son sus limitacionesjemplo deep linking y comparar con GoRouter. Ver main.dart
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen(),
        //   ),
        // ); // !1 Forma de trabajar routes con Flutter **Routes
        // Navigator.pushNamed(context, menuItem.link ); // !2 Forma de trabajar routes con Flutter **Routes

        // context.pushNamed( CardsScreen.name ); //!Forma de trabajar routes con go?router **Routes
        context.push( menuItem.link ); //Esta es la manera de implementar go_router **Routes **Practice
        //!2Forma de trabajar routes con go?router **Routes

      },
    );
  }
}

