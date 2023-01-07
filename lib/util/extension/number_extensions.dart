import 'package:intl/intl.dart';

extension DoubleExt on double {
  String toCurrency() {
    return NumberFormat.currency(decimalDigits: 0, locale: 'id', symbol: 'Rp. ')
        .format(this);
  }
}
