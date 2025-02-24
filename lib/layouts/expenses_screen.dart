import 'package:expenses_app/data/expenses_data.dart';
import 'package:flutter/material.dart';

import '../widgets/expenses_item.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('......'),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context,index) => expensesItem(model: registeredExpenses, index: index),
                  separatorBuilder: (context,index) => SizedBox(height: 10,),
                  itemCount: registeredExpenses.length
              ),
            )
          ],
        ),
      ),
    );
  }
}
