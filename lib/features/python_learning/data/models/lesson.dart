import '../../domain/entities/lesson_entity.dart';

class Lesson extends LessonEntity {
  Lesson({
    required super.id,
    required super.title,
    required super.description,
    required super.initialCode,
    required super.testCases,
    super.isCompleted = false,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    final testCases = (json['testCases'] as List?)
            ?.map((e) => Map<String, String>.from(e as Map))
            .toList() ??
        [];
    return Lesson(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      initialCode: json['initialCode'] as String,
      testCases: testCases,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'initialCode': initialCode,
        'testCases': testCases,
        'isCompleted': isCompleted,
      };
}
