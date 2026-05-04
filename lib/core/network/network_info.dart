abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  // TODO: inject connectivity_plus
  @override
  Future<bool> get isConnected async => true;
}
