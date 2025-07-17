import 'package:get/get.dart';

import 'data/repositories/lesson_repository.dart';
import 'domain/usecases/get_lessons_usecase.dart';
import 'domain/usecases/execute_python_code_usecase.dart';
import 'domain/usecases/save_progress_usecase.dart';
import 'domain/usecases/get_progress_usecase.dart';
import 'presentation/controller/python_learning_controller.dart';

class PythonLearningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LessonRepository());
    Get.lazyPut(() => GetLessonsUseCase(Get.find()));
    Get.lazyPut(() => ExecutePythonCodeUseCase());
    Get.lazyPut(() => SaveProgressUseCase());
    Get.lazyPut(() => GetProgressUseCase());
    Get.lazyPut(() => PythonLearningController(
          getLessons: Get.find(),
          executeCode: Get.find(),
          saveProgress: Get.find(),
          getProgress: Get.find(),
        ));
  }
}
