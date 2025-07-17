import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('Python Learning Module'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => Get.toNamed(AppRoutes.pythonLearning),
        ),
      ],
    );
  }
}
