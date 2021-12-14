import 'package:dio/dio.dart';

part './network_manager_interface.dart';

class NetworkManager extends INetworkManager {
  static NetworkManager? _instance;

  static NetworkManager get instance {
    _instance ??= NetworkManager._();

    return _instance!;
  }

  NetworkManager._();

  @override
  void addBaseHeader(String value) {
    _dio.options.headers[""] = value;
  }
}
