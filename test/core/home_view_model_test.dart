import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:refactor_flutter_aps/core/enums/database_enums.dart';
import 'package:refactor_flutter_aps/core/manager/database/database_manager_interface.dart';
import 'package:refactor_flutter_aps/core/provider/user_context.dart';
import 'package:refactor_flutter_aps/feature/home/model/home_model.dart';
import 'package:refactor_flutter_aps/feature/home/view_model/home_view_model.dart';

void main() {
  late HomeViewModel homeViewModel;
  setUp(() {
    homeViewModel = HomeViewModel();
  });
  test('_controlResponse Test', () {
    final response = homeViewModel.controlResponse(
        Response(data: ResourceModel(page: 15).toJson(), requestOptions: RequestOptions(path: "/hello")));

    expect(response?.page, 15);
  });

  test('savePageNumer Test', () async {
    final response = await homeViewModel.savePageNumber(
        MockDatabaseManager(), User("bacik"), ResourceModel(page: 0, support: Support(text: "vb")));

    expect(response, "vb");
  });

  test('minus Test', () async {
    final response = homeViewModel.minusPageAndAge(123123, 0);

    expect(response, 0);
  });
}

class MockDatabaseManager extends IDatabaseManager {
  @override
  Future<bool> saveString(DatabaseEnums key, String value) async {
    return true;
  }
}
