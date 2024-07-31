import 'package:yes_no_app/domain/entities/message.dart';
//Se pueden crear modelos desde la extensión VSCode PasteJson as code o desde la pagina https://app.quicktype.io/ , practicar generando modelos desde la extensión también**Tool **practice

class YesNoModel {
  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  final String answer;
  final bool forced;
  final String image;

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );//porqué y para qué sirve el factory **practice

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() => Message(//método para tener ya las respuestas y enviarlas y sólo llamar el método donde se necesite. Esto es el mapper y debería estar en un archivo diferente. **Http **BP
    text: answer == 'yes' ? 'Si' : 'No', 
    fromWho: FromWho.hers,
    imageUrl: image
  );
}
