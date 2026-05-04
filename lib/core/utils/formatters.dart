class Formatters {
  Formatters._();
  static String currency(double amount) => '\$${amount.toStringAsFixed(2)}'; // TODO
  static String date(DateTime dt) => dt.toString(); // TODO
  static String distance(double metres) => '${metres.toStringAsFixed(1)} km'; // TODO
}
