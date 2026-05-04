class AppLogger {
  static void d(String msg) {
    assert(() { print('[DEBUG] \$msg'); return true; }());
  }
  static void e(String msg, [Object? error]) {
    assert(() { print('[ERROR] \$msg \${error ?? ""}'); return true; }());
  }
}
