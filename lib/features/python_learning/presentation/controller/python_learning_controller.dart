import 'package:get/get.dart';

import '../../domain/entities/lesson_entity.dart';
import '../../domain/usecases/execute_python_code_usecase.dart';
import '../../domain/usecases/get_lessons_usecase.dart';
import '../../domain/usecases/save_progress_usecase.dart';
import '../../domain/usecases/get_progress_usecase.dart';

class PythonLearningController extends GetxController {
  PythonLearningController({
    required this.getLessons,
    required this.executeCode,
    required this.saveProgress,
    required this.getProgress,
  });

  final GetLessonsUseCase getLessons;
  final ExecutePythonCodeUseCase executeCode;
  final SaveProgressUseCase saveProgress;
  final GetProgressUseCase getProgress;

  final lessons = <LessonEntity>[].obs;
  final output = ''.obs;
  final selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadLessons();
  }

  Future<void> loadLessons() async {
    final data = await getLessons();
    final progress = await getProgress();
    for (final lesson in data) {
      lesson.isCompleted = progress[lesson.id] ?? false;
    }
    lessons.assignAll(data);
  }

  LessonEntity get currentLesson => lessons[selectedIndex.value];

  Future<void> runCode(String code) async {
    final result = await executeCode(code);
    output.value = result.error.isNotEmpty ? result.error : result.output;
  }

  void checkAnswer(String code) {
    final lesson = currentLesson;
    final expected = lesson.testCases.first['expectedOutput'] ?? '';
    if (output.value.trim() == expected.trim()) {
      lesson.isCompleted = true;
      updateLessonProgress();
    }
  }

  Future<void> updateLessonProgress() async {
    final progress = {for (var l in lessons) l.id: l.isCompleted};
    await saveProgress(progress);
  }

  void nextLesson() {
    if (selectedIndex.value < lessons.length - 1) {
      selectedIndex.value += 1;
    }
  }

  void previousLesson() {
    if (selectedIndex.value > 0) {
      selectedIndex.value -= 1;
    }
  }
}
