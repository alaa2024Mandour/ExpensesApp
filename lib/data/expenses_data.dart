import 'package:expenses_app/models/expenses_model.dart';

List<Expenses> registeredExpenses = [
  Expenses(
      productName: 'Flutter Training',
      amount: 500,
      date: DateTime.now(),
      categories: Categories.work
  ),

  Expenses(
      productName: 'Wool jacket',
      amount: 850,
      date: DateTime.now(),
      categories: Categories.clothes
  ),

  Expenses(
      productName: 'Derma cream',
      amount: 10,
      date: DateTime.now(),
      categories: Categories.medicine
  ),

  Expenses(
      productName: 'Saudi Arabia',
      amount: 1000,
      date: DateTime.now(),
      categories: Categories.travel
  ),

  Expenses(
      productName: 'Pizza',
      amount: 20,
      date: DateTime.now(),
      categories: Categories.food
  ),
];