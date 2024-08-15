import 'package:intl/intl.dart';
// ESta clase se crea para que no importe el tipo de dependencia que use para hacer los formatos de numeros para personas, de esta manera se crea una capa que previene de tener que cambiar en varias partes de la app por si la dependencia desaparece o cambia. **Arch **Tools

class HumanFormats {
  static String number(double number) {
    final formattedNumber =
        NumberFormat.compactCurrency(decimalDigits: 0, symbol: '', locale: 'en')
            .format(number);

    return formattedNumber;
  }
}
