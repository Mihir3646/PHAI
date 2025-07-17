import 'package:flutter_test/flutter_test.dart';
import 'package:relaunch_programming/features/python_learning/domain/usecases/get_lessons_usecase.dart';
import 'package:relaunch_programming/features/python_learning/data/repositories/lesson_repository.dart';

void main() {
  test('GetLessonsUseCase returns lessons', () async {
    final usecase = GetLessonsUseCase(LessonRepository());
    final lessons = await usecase();
    expect(lessons.isNotEmpty, true);
  });
}
