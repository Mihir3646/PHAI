import '../../data/repositories/lesson_repository.dart';
import '../entities/lesson_entity.dart';

class GetLessonsUseCase {
  final LessonRepository repository;
  GetLessonsUseCase(this.repository);

  Future<List<LessonEntity>> call() async {
    return repository.getLessons();
  }
}
