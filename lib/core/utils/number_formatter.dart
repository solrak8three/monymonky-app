// number_formatter.dart
import 'package:intl/intl.dart';

class NumberFormatter {
  static String formatToTwoDecimals(double number) {
    return NumberFormat('0.00', 'es_ES').format(number);
  }
}
