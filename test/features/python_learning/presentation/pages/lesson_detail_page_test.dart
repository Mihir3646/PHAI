import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:relaunch_programming/features/python_learning/presentation/pages/lesson_detail_page.dart';
import 'package:relaunch_programming/features/python_learning/presentation/controller/python_learning_controller.dart';
import 'package:relaunch_programming/features/python_learning/domain/usecases/get_lessons_usecase.dart';
import 'package:relaunch_programming/features/python_learning/domain/usecases/execute_python_code_usecase.dart';
import 'package:relaunch_programming/features/python_learning/domain/usecases/save_progress_usecase.dart';
import 'package:relaunch_programming/features/python_learning/domain/usecases/get_progress_usecase.dart';
import 'package:relaunch_programming/features/python_learning/data/repositories/lesson_repository.dart';

void main() {
  testWidgets('LessonDetailPage renders editor', (tester) async {
    final controller = PythonLearningController(
      getLessons: GetLessonsUseCase(LessonRepository()),
      executeCode: ExecutePythonCodeUseCase(),
      saveProgress: SaveProgressUseCase(),
      getProgress: GetProgressUseCase(),
    );
    await controller.loadLessons();
    Get.put(controller);
    await tester.pumpWidget(const GetMaterialApp(home: LessonDetailPage()));
    await tester.pumpAndSettle();
    expect(find.byType(TextField), findsWidgets);
  });
}
