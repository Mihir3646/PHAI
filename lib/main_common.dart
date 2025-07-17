import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:python_ffi/python_ffi.dart';
import 'app.dart';

Future<void> mainCommon(String envFile) async {
  WidgetsFlutterBinding.ensureInitialized();
  await PythonFfi.instance.initialize();
  await dotenv.load(fileName: envFile);
  await GetStorage.init();
  runApp(const App());
}
