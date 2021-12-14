import 'package:refactor_flutter_aps/core/enums/database_enums.dart';

abstract class IDatabaseManager {
  Future<bool> saveString(DatabaseEnums key, String value);
}
