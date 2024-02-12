import 'package:flutter/material.dart';
import 'package:task_buddy/const/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // System theme settings
      darkTheme: ThemeData.dark(),
    );
  }
}
