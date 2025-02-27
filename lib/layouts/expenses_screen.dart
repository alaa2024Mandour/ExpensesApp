import 'package:expenses_app/cubit/cubit.dart';
import 'package:expenses_app/cubit/status.dart';
import 'package:expenses_app/data/expenses_data.dart';
import 'package:expenses_app/models/expenses_model.dart';
import 'package:expenses_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/chart/chart.dart';
import '../widgets/expenses_item.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExpensesCubit, Status>(
      listener: (BuildContext context, Status? state) {},
      builder: (BuildContext context, state) {
        var cubit = ExpensesCubit.get(context);
        double width = MediaQuery.of(context).size.width;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Welcome In Your Expenses App',
              style: TextStyle(fontSize: 15),
            ),
            leading: Icon(Icons.arrow_back_ios_new),
            actions: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder:
                        (context) => DraggableScrollableSheet(
                          initialChildSize: 0.5, // 50% of screen height
                          minChildSize: 0.3, // Minimum height
                          maxChildSize: 0.9, // Maximum height
                          expand: false,
                          builder:
                              (context, scrollController) => newExpenses(
                                scrollController: scrollController,
                                titleController: cubit.titleController,
                                amountController: cubit.amountController,
                                expenseDate: cubit.expenseDate,
                                context: context,
                                formatDate: (onValue) {
                                  cubit.setDate(onValue);
                                },
                                chooseCategory: (value) {
                                  cubit.setCategory(value);
                                },
                                selectedCategory: cubit.selectedCategory,
                                addExpensesItem: () {
                                  cubit.addNewExpense(
                                    Expenses(
                                      productName: cubit.titleController.text,
                                      amount: double.parse(
                                        cubit.amountController.text,
                                      ),
                                      date: cubit.originalDate!,
                                      categories: cubit.selectedCategory,
                                    ),
                                  );
                                },
                              ),
                        ),
                  );
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
          body: Center(
            child:
                width < 600
                    ? Column(
                      children: [
                        Expanded(child: Chart()),
                        Expanded(
                          child: ListView.separated(
                            itemBuilder:
                                (context, index) => Dismissible(
                                  background: Container(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.error.withOpacity(0.7),
                                    margin: EdgeInsets.symmetric(
                                      horizontal:
                                          Theme.of(
                                            context,
                                          ).cardTheme.margin!.horizontal,
                                    ),
                                  ),
                                  key: ValueKey(registeredExpenses[index]),
                                  onDismissed:
                                      (direction) => {
                                        cubit.removeExpense(
                                          registeredExpenses[index],
                                        ),
                                      },
                                  child: expensesItem(
                                    model: registeredExpenses,
                                    index: index,
                                  ),
                                ),
                            separatorBuilder:
                                (context, index) => SizedBox(height: 10),
                            itemCount: registeredExpenses.length,
                          ),
                        ),
                      ],
                    )
                    : Row(
                      children: [
                        Expanded(child: Chart()),
                        Expanded(
                          child: ListView.separated(
                            itemBuilder:
                                (context, index) => Dismissible(
                                  background: Container(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.error.withOpacity(0.7),
                                    margin: EdgeInsets.symmetric(
                                      horizontal:
                                          Theme.of(
                                            context,
                                          ).cardTheme.margin!.horizontal,
                                    ),
                                  ),
                                  key: ValueKey(registeredExpenses[index]),
                                  onDismissed:
                                      (direction) => {
                                        cubit.removeExpense(
                                          registeredExpenses[index],
                                        ),
                                      },
                                  child: expensesItem(
                                    model: registeredExpenses,
                                    index: index,
                                  ),
                                ),
                            separatorBuilder:
                                (context, index) => SizedBox(height: 10),
                            itemCount: registeredExpenses.length,
                          ),
                        ),
                      ],
                    ),
          ),
        );
      },
    );
  }
}
