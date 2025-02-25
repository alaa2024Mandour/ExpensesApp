import 'package:expenses_app/cubit/cubit.dart';
import 'package:expenses_app/cubit/status.dart';
import 'package:expenses_app/layouts/expenses_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider( create: (BuildContext context) => ExpensesCubit()),
      ],
      child: BlocConsumer<ExpensesCubit,Status>(
        listener: (BuildContext context, Status state) {  },
        builder: (BuildContext context, Status state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
            ),
            initialRoute: 'expenses_screen',
            routes: {
              'expenses_screen': (context) => ExpensesScreen(),
            },
          );
        },
      ),
    );
  }
}

