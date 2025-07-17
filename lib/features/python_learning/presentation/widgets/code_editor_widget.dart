import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:highlight/languages/python.dart';

class CodeEditorWidget extends StatelessWidget {
  final CodeController controller;
  const CodeEditorWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CodeField(
      controller: controller,
      language: python,
      textStyle: const TextStyle(fontFamily: 'monospace'),
      theme: githubTheme,
    );
  }
}
