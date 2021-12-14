import 'package:flutter_test/flutter_test.dart';

import 'package:refactor_flutter_aps/core/manager/network/network_manager.dart';

void main() {
  late INetworkManager _networkManager;
  setUp(() {
    _networkManager = NetworkManager.instance..init('https://jsonplaceholder.typicode.com', {});
  });
  test('Sample Test', () async {
    final response = await _networkManager.manager.get("/todos/1");
  });
}
