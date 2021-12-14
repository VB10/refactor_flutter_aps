import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:refactor_flutter_aps/core/manager/database/shared_manager.dart';

import 'core/enums/dotenv_enums.dart';
import 'core/manager/network/network_manager.dart';
import 'core/provider/user_context.dart';
import 'feature/home/view/home_view.dart';

Future<void> main() async {
  await dotenv.load();
  await SharedManager.instance.init();
  NetworkManager.instance.init(dotenv.get(DotEnvEnums.BASE_URL.name), {});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => UserContext(),
      child: const MaterialApp(
        home: HomeView(),
      ),
    );
  }
}
