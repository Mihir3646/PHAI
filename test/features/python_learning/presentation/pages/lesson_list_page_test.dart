import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:relaunch_programming/features/python_learning/presentation/pages/lesson_list_page.dart';
import 'package:relaunch_programming/features/python_learning/presentation/controller/python_learning_controller.dart';
import 'package:relaunch_programming/features/python_learning/domain/usecases/get_lessons_usecase.dart';
import 'package:relaunch_programming/features/python_learning/domain/usecases/execute_python_code_usecase.dart';
import 'package:relaunch_programming/features/python_learning/domain/usecases/save_progress_usecase.dart';
import 'package:relaunch_programming/features/python_learning/domain/usecases/get_progress_usecase.dart';
import 'package:relaunch_programming/features/python_learning/data/repositories/lesson_repository.dart';

void main() {
  testWidgets('LessonListPage shows lessons', (tester) async {
    Get.put(PythonLearningController(
      getLessons: GetLessonsUseCase(LessonRepository()),
      executeCode: ExecutePythonCodeUseCase(),
      saveProgress: SaveProgressUseCase(),
      getProgress: GetProgressUseCase(),
    ));
    await tester.pumpWidget(const GetMaterialApp(home: LessonListPage()));
    await tester.pumpAndSettle();
    expect(find.byType(ListTile), findsWidgets);
  });
}
