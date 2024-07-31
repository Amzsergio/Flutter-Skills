import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Provider al ser instalado solo le da acceso a sus hijos para que lo vean, para el resto no estan disponibles su visibilidad **Provider Para ver su funcionamiento https://pub.dev/packages/provider

import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider( // Multiprovider() permite definir varios tipos de providers. **Widget **Provider
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider() ) // El guion bajo se usa para indicar que no nesecito este argumento **BP  // ChangeNotifierProvider ** Widget, ** Provider Así  comparto el provider al resto de hijos. // **Practice , validar con el widget inspector en el build context el arbol de widgets. 
      ],
      child: MaterialApp(
        title: 'Yes No App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme( selectedColor: 0 ).theme(),
        home: const ChatScreen()
      ),
    );
  }
}


