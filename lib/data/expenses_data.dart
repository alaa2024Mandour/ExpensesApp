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

class ExpensesBucket{
  final Categories category ;
  final List<Expenses> expenses;

  ExpensesBucket(this.category, this.expenses);

  ExpensesBucket.forCategory(List<Expenses> allExpenses,this.category):expenses=allExpenses
  .where((element)=> element.categories == category).toList();

  double get totalExpenses {
    double sum =0;
    for(var expense in expenses){
      sum += expense.amount;
    }
    return sum;
  }
}