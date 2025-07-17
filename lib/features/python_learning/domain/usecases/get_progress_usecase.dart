import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class GetProgressUseCase {
  Future<Map<String, bool>> call() async {
    final prefs = await SharedPreferences.getInstance();
    final str = prefs.getString('python_learning_progress');
    if (str == null) return {};
    final Map<String, dynamic> json = jsonDecode(str);
    return json.map((key, value) => MapEntry(key, value as bool));
  }
}
