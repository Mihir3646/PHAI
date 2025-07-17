import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/python_learning_controller.dart';
import '../widgets/lesson_card.dart';
import '../../routes.dart';

class LessonListPage extends GetView<PythonLearningController> {
  const LessonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Python Lessons')),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.lessons.length,
          itemBuilder: (context, index) {
            final lesson = controller.lessons[index];
            return LessonCard(
              lesson: lesson,
              onTap: () {
                controller.selectedIndex.value = index;
                Get.toNamed(PythonLearningRoutes.detail);
              },
            );
          },
        ),
      ),
    );
  }
}
