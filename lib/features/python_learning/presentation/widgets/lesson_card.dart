import 'package:flutter/material.dart';
import '../../domain/entities/lesson_entity.dart';

class LessonCard extends StatelessWidget {
  final LessonEntity lesson;
  final VoidCallback onTap;
  const LessonCard({super.key, required this.lesson, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(lesson.title),
        trailing: lesson.isCompleted
            ? const Icon(Icons.check, color: Colors.green)
            : const Icon(Icons.play_arrow),
        onTap: onTap,
      ),
    );
  }
}
