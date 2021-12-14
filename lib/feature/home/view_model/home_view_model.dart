import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:refactor_flutter_aps/core/enums/database_enums.dart';
import 'package:refactor_flutter_aps/core/manager/database/database_manager_interface.dart';
import 'package:refactor_flutter_aps/core/manager/database/shared_manager.dart';
import 'package:refactor_flutter_aps/core/provider/user_context.dart';
import 'package:refactor_flutter_aps/feature/home/model/home_model.dart';
import '../../../core/manager/network/network_manager.dart';

class HomeViewModel extends ChangeNotifier {
  ResourceModel? resourceModel;
  String? title;
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> fetchItems() async {
    _changeLoading();

    final response = await NetworkManager.instance.manager.get('/unknown');
    if (response.statusCode == HttpStatus.ok) {
      resourceModel = controlResponse(response);
      notifyListeners();
    }
    _changeLoading();
  }

  ResourceModel? controlResponse(Response<dynamic> response) {
    if (response.data is Map<String, dynamic>) {
      return ResourceModel.fromJson(response.data);
    } else {
      return null;
    }
  }

  void saveAndShowNumber(BuildContext context) async {
    changeTitle(await savePageNumber(SharedManager.instance, context.read<UserContext>().user, resourceModel));
  }

  Future<String?> savePageNumber(IDatabaseManager manager, User? user, ResourceModel? model) async {
    if (model?.isPageHigher() ?? false) {
      final _result = minusPageAndAge(resourceModel?.page, user?.age).toString();
      await manager.saveString(DatabaseEnums.home, _result);
      return _result;
    }
    return model?.support?.text;
  }

  /// Expect if is age equal to zero return 0
  int minusPageAndAge(int? page, int? age) {
    return (page ?? 1) * (age ?? 0);
  }

  void changeTitle(String? value) {
    title = value;
    notifyListeners();
  }
}
