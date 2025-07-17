import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:highlight/languages/python.dart';

import '../controller/python_learning_controller.dart';
import '../widgets/code_editor_widget.dart';

class LessonDetailPage extends StatefulWidget {
  const LessonDetailPage({super.key});

  @override
  State<LessonDetailPage> createState() => _LessonDetailPageState();
}

class _LessonDetailPageState extends State<LessonDetailPage> {
  late CodeController codeController;

  @override
  void initState() {
    super.initState();
    final lesson = Get.find<PythonLearningController>().currentLesson;
    codeController = CodeController(
      text: lesson.initialCode,
      language: python,
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PythonLearningController>();
    final lesson = controller.currentLesson;
    return Scaffold(
      appBar: AppBar(title: Text(lesson.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(lesson.description),
            const SizedBox(height: 16),
            Expanded(child: CodeEditorWidget(controller: codeController)),
            const SizedBox(height: 16),
            Obx(() => Text(controller.output.value)),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: controller.previousLesson,
              child: const Text('Previous'),
            ),
            ElevatedButton(
              onPressed: controller.nextLesson,
              child: const Text('Next'),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await controller.runCode(codeController.text);
          controller.checkAnswer(codeController.text);
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
