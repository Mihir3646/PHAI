class LessonEntity {
  final String id;
  final String title;
  final String description;
  final String initialCode;
  final List<Map<String, String>> testCases;
  bool isCompleted;

  LessonEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.initialCode,
    required this.testCases,
    this.isCompleted = false,
  });
}
