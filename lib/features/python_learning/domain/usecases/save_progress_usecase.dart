import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

class SaveProgressUseCase {
  Future<void> call(Map<String, bool> progress) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'python_learning_progress',
      jsonEncode(progress),
    );
  }
}
