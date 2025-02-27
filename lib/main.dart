import 'package:expenses_app/cubit/cubit.dart';
import 'package:expenses_app/cubit/status.dart';
import 'package:expenses_app/layouts/expenses_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((onValue)=>  runApp(const MyApp()));
}

var myColorScheme = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 18, 32, 161));

var myDarkColorScheme = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 15, 26, 125));

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
            theme: ThemeData().copyWith(
              colorScheme: myColorScheme,
              appBarTheme: AppBarTheme().copyWith(
                backgroundColor: myColorScheme.onPrimaryContainer,
                foregroundColor: myColorScheme.primaryContainer,
              ),
              cardTheme: CardTheme().copyWith(
                color: myColorScheme.secondaryContainer,
                margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8)
              ),

              outlinedButtonTheme: OutlinedButtonThemeData(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: myColorScheme.onPrimaryContainer)
                )
              )
            ),
            darkTheme: ThemeData.dark().copyWith(
                colorScheme: myDarkColorScheme,
                appBarTheme: AppBarTheme().copyWith(
                  backgroundColor: myDarkColorScheme.onPrimaryContainer,
                  foregroundColor: myDarkColorScheme.primaryContainer,
                ),
                cardTheme: CardTheme().copyWith(
                    color: myDarkColorScheme.primary,
                    margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8)
                ),
                bottomSheetTheme: BottomSheetThemeData(
                  backgroundColor: myDarkColorScheme.onPrimaryContainer
                ),
                outlinedButtonTheme: OutlinedButtonThemeData(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: myDarkColorScheme.onSecondary),
                        foregroundColor: myDarkColorScheme.onSecondary
                    )
                ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    foregroundColor: myDarkColorScheme.onSecondary
                ),
              ),
            ),
            themeMode: ThemeMode.system,
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

