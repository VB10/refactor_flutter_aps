import 'package:refactor_flutter_aps/core/enums/database_enums.dart';
import 'package:refactor_flutter_aps/core/manager/database/database_manager_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedManager extends IDatabaseManager {
  static SharedManager? _instace;
  static SharedManager get instance {
    _instace ??= SharedManager._init();
    return _instace!;
  }

  late SharedPreferences preferences;
  SharedManager._init();

  Future<void> init() async {
    instance.preferences = await SharedPreferences.getInstance();
  }

  @override
  Future<bool> saveString(DatabaseEnums key, String value) async {
    return await preferences.setString(key.name, value);
  }
}
