import 'package:flutter_test/flutter_test.dart';
import 'package:relaunch_programming/features/python_learning/presentation/controller/python_learning_controller.dart';
import 'package:relaunch_programming/features/python_learning/domain/usecases/get_lessons_usecase.dart';
import 'package:relaunch_programming/features/python_learning/domain/usecases/execute_python_code_usecase.dart';
import 'package:relaunch_programming/features/python_learning/domain/usecases/save_progress_usecase.dart';
import 'package:relaunch_programming/features/python_learning/domain/usecases/get_progress_usecase.dart';
import 'package:relaunch_programming/features/python_learning/data/repositories/lesson_repository.dart';

void main() {
  test('Controller loads lessons', () async {
    final controller = PythonLearningController(
      getLessons: GetLessonsUseCase(LessonRepository()),
      executeCode: ExecutePythonCodeUseCase(),
      saveProgress: SaveProgressUseCase(),
      getProgress: GetProgressUseCase(),
    );
    await controller.loadLessons();
    expect(controller.lessons.isNotEmpty, true);
  });
}
