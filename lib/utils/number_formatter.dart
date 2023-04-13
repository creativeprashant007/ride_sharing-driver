import 'package:intl/intl.dart';

class NumberFormatter {
  NumberFormatter._();
  static NumberFormat formatter =
      NumberFormat.currency(name: "", customPattern: "###,##0");
}
