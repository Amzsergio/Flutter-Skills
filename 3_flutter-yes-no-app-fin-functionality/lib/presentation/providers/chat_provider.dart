import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier { // !ChangeNotifier, aqui sirve para decir que se notifique cuando haya cambios. **Widget **Provider
  final chatScrollController = ScrollController(); // Esto se crea con el fin de hacer un controller que suba automaticamente la pantalla del chat cuando se envía un mensaje. ScrollController() **Widget 
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me),
  ]; // Este es el mock de mensajes **AppExp

  Future<void> sendMessage(String text) async { // **Explicar porqué aquí es future, este método sirve para actualizar mi lista de mensajes en el provider **Practice **Provider
    if (text.isEmpty) return; // Valida que no se envíe el texto vacío **AppExp 

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {// Validación para desencadenar el llamado http. 
      herReply();
    }

    notifyListeners(); // **Provider , notifyListeners() notifica que hay cambios. 
    moveScrollToBottom(); // Animacion
  }

  Future<void> herReply() async { // Este mensaje se crea en contexto de la invocación http **http  
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();

    moveScrollToBottom();// Animacion
  }

  Future<void> moveScrollToBottom() async { //
    await Future.delayed(const Duration(milliseconds: 100));// Esto se realiza para retrasar la ejecución de la animación. 

    chatScrollController.animateTo( // Animaciones  con el contorller **Practice **Animations
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), // Se cancela la animación si se hace scroll antes de estos 300 milisegundos **Practice
        curve: Curves.easeOut);
  }
}
