import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:relaunch_programming/features/dashboard/dashboard_binding.dart';
import 'package:relaunch_programming/features/dashboard/dashboard_controller.dart';
import 'package:relaunch_programming/features/dashboard/dashboard_page.dart';

void main() {
  testWidgets('Dashboard bottom navigation works', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: const DashboardPage(),
        initialBinding: DashboardBinding(),
      ),
    );

    expect(find.byType(BottomNavigationBar), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);

    final controller = Get.find<DashboardController>();
    expect(controller.currentIndex.value, 0);
    expect(find.text('Home Page'), findsOneWidget);

    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();

    expect(controller.currentIndex.value, 1);
    expect(find.text('Settings Page'), findsOneWidget);

    await tester.tap(find.text('Profile'));
    await tester.pumpAndSettle();

    expect(controller.currentIndex.value, 2);
    expect(find.text('Profile Page'), findsOneWidget);
  });
}
