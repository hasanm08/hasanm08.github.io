//import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hasanm08/my_app.dart';
import 'package:hasanm08/providers/app_settings.dart';
import 'package:provider/provider.dart';

import 'Utils/web_url_strategy_stub.dart'
    if (dart.library.html) 'Utils/web_url_strategy_web.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureWebUrlStrategy();
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppSettings(),
      child: const MyApp(),
    ),
  );
}
