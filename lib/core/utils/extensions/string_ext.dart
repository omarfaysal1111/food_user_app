extension StringExt on String {
  String capitalize() =>
      isEmpty ? this : '\${this[0].toUpperCase()}\${substring(1)}';
  // TODO: add more string helpers
}
