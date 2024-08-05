import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

// Aqui se crea un drawer personalizado **Drawer
class SideMenu extends StatefulWidget {
  // Se necesita Stateful para navDrawerIndex. **AppExp **Stateful

  final GlobalKey<ScaffoldState> scaffoldKey; // Aquí requiero un scaffoldKey que viene de home_screen para tener la referencia del scaffold cuando me quiera devolver un vez vaya a la pantalla que seleccione en mi drawer. **Drawer **Ctaxi **AppExp

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0; // Aquí se podría tener un gestor de estado para que identifique cual fue el último seleccionado. **Practice

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35; // esto es para determinar, si es mayor a 356 es porque tiene notch, de lo contrario, no tiene notch. **Ctaxi **Drawer

      // print('Android $hasNotch'); //! Es para ver la altura de notch **Debug

    return NavigationDrawer(
        // Este es el canvas de un drawer. NavigationDrawer() **Widget
        selectedIndex:
            navDrawerIndex, // es para que esté ñseleccionada la opcción en el drawer.
        onDestinationSelected: (value) {// Aquí manejo el destino cuando lo selecciono. 
          setState(() {
            navDrawerIndex = value;
          }); // Para actualizar el valor de navDrawerIndex

          final menuItem = appMenuItems[value];
          context.push(menuItem.link);//  go_Router
          widget.scaffoldKey.currentState?.closeDrawer();// Entro al wdiget, al scaffoldKey y luego al current state. , hay varias posibilidades, en este caso cierro el drawer y me pide que valide si es null **Drawer **Ctaxi
        },
        children: [// De esta maner se podría hacer para Ctaxi **Ctaxi 
          Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
            child: const Text('Main'),// Padding adaptado al Notch 
          ),
          ...appMenuItems.sublist(0, 3).map(// SubLista **Dart
                (item) => NavigationDrawerDestination(
                  icon: Icon(item.icon),
                  label: Text(item.title),
                ),
              ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: Text('More options'),
          ),
          ...appMenuItems.sublist(3).map(// SubLista **Dart
                (item) => NavigationDrawerDestination(
                  icon: Icon(item.icon),
                  label: Text(item.title),
                ),
              ),
        ]);
  }
}
