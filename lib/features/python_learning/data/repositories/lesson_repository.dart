import '../models/lesson.dart';

class LessonRepository {
  Future<List<Lesson>> getLessons() async {
    return _lessons;
  }

  final List<Lesson> _lessons = [
    Lesson(
      id: '1',
      title: 'Hello World',
      description: 'Print "Hello World" to the console.',
      initialCode: "print('Hello World')",
      testCases: [
        {'input': '', 'expectedOutput': 'Hello World\n'},
      ],
    ),
    Lesson(
      id: '2',
      title: 'Variables and Data Types',
      description: 'Create a variable called x with value 5 and print it.',
      initialCode: 'x = 5\nprint(x)',
      testCases: [
        {'input': '', 'expectedOutput': '5\n'},
      ],
    ),
    Lesson(
      id: '3',
      title: 'Functions',
      description: 'Write a function add(a, b) that returns the sum.',
      initialCode: 'def add(a, b):\n    return a + b',
      testCases: [
        {'input': 'add(2, 3)', 'expectedOutput': '5'},
      ],
    ),
  ];
}
