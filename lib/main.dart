import 'package:expenses_app/layouts/expenses_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: 'expenses_screen',
      routes: {
        'expenses_screen': (context) => ExpensesScreen(),
      },
    );
  }
}

