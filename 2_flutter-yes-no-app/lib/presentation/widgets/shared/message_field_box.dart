import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController(); // Widget TextEditingController() que da control al input que lo va asociar. **Widget
    final focusNode = FocusNode(); // !Widget FocusNode() para hacer foco en un elemento. **Widget

    final outlineInputBorder = UnderlineInputBorder(// !Esto se hace para crear un estilo que se puede repetir **Style **GP
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration( // !Esto se hace para crear un estilo que se puede repetir **Style **BP
    //!Practicar con los InputDecoration **Practice
      hintText: 'End your message with a "?"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          print('button: $textValue');
          textController.clear(); // Cuando se envia se limpia el teclado **App Exp
        },
      ),
    );

    return TextFormField(
      // keyboardAppearance: !Practicar con diferentes teclados **Practice
      onTapOutside: (event) {
        focusNode.unfocus(); // !FocusNode() , Cuando se hace tap afuera, quitar el foco **Style **Widget
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Submit value $value');
        textController.clear();
        focusNode.requestFocus(); // !Para mantener el foco del widget FocusNode() **Style **Widget
      },
    );
  }
}
