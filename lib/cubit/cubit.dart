import 'package:expenses_app/cubit/status.dart';
import 'package:expenses_app/data/expenses_data.dart';
import 'package:expenses_app/models/expenses_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ExpensesCubit extends Cubit<Status> {
  ExpensesCubit() : super(InitialState());

  static ExpensesCubit get(context) => BlocProvider.of(context);

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final formatter = DateFormat.yMd();
  DateTime? originalDate ;
  String? expenseDate  ;

  @override
  Future<void> close() {
    titleController.dispose();
    amountController.dispose();
    return super.close();
  }

  //#### Change Date State ####
  void setDate(DateTime date){
    originalDate = date;
    expenseDate = formatter.format(originalDate!);
    print(expenseDate);
    emit(ChoosingDateState());
  }

//#### Change Category State ####
  Categories selectedCategory = Categories.food;
  void setCategory(Categories category){
    selectedCategory = category;
    emit(ChoosingCategoryState());
  }

//#### Add New Expense####
void addNewExpense(Expenses expense){
    registeredExpenses.add(expense);
    titleController.clear();
    amountController.clear();
    emit(AddNewExpenseState());
}

//#### Add New Expense####
  void removeExpense(Expenses expense){
    registeredExpenses.remove(expense);
    emit(RemoveExpenseState());
  }

}