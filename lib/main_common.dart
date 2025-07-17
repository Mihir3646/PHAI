import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app.dart';

Future<void> mainCommon(String envFile) async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: envFile);
  runApp(const App());
}
