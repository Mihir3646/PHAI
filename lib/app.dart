import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'features/onboarding/bindings.dart';
import 'features/onboarding/presentation/pages/onboarding_page.dart';
import 'features/onboarding/presentation/controller/onboarding_controller.dart';
import 'features/dashboard/dashboard_binding.dart';
import 'features/dashboard/dashboard_page.dart';
import 'features/home/home_page.dart';
import 'features/settings/settings_page.dart';
import 'features/profile/profile_page.dart';
import 'routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final initialRoute =
        box.read(OnboardingController.hasOnboardedKey) == true
            ? AppRoutes.dashboard
            : AppRoutes.onboarding;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Relaunch Programming',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: initialRoute,
      getPages: [
        GetPage(
          name: AppRoutes.dashboard,
          page: () => const DashboardPage(),
          binding: DashboardBinding(),
        ),
        GetPage(
          name: AppRoutes.home,
          page: () => const HomePage(),
        ),
        GetPage(
          name: AppRoutes.settings,
          page: () => const SettingsPage(),
        ),
        GetPage(
          name: AppRoutes.profile,
          page: () => const ProfilePage(),
        ),
        GetPage(
          name: AppRoutes.onboarding,
          page: () => const OnboardingPage(),
          binding: OnboardingBinding(),
        ),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final env = dotenv.env['APP_ENV'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('${widget.title} ($env)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
