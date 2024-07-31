import 'package:dio/dio.dart'; // Hay personas que prefieren Dio sobre http porque es mas ligero que http y requieren menos dependencias **BP **Http
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async { //Practicar Llamados cont http y dio **Practice **Http
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsonMap(response.data);// Esto se llaman mappers **Http **Arch Infraestructura es un puente entre dominio y presentacion

    return yesNoModel.toMessageEntity(); // !Esta es la manera de llamar las respuestas del modelo **Http **BP

    // throw UnimplementedError(); //!Se usa para errores no implementados, se recomienda brakpoints, **Debug
  }
}
