import 'package:expenses_app/models/expenses_model.dart';
import 'package:expenses_app/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

Widget newExpenses({
  required ScrollController scrollController ,
  required TextEditingController titleController,
  required TextEditingController amountController,
  required String? expenseDate,
  required Function formatDate,
  required Function chooseCategory,
  required Categories? selectedCategory,
  required Function addExpensesItem,
  required context}) => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 35),
  child: SizedBox(
    width: double.infinity,
    height: 350,
    child: SingleChildScrollView(
      controller: scrollController ,
      child: Column(
        spacing: 20,
        children: [
          expenseField(
              controller: titleController,
              label: 'Title', type:
          TextInputType.text,
              maxChar: 50),

          Row(
            children: [
              Expanded(child:
              expenseField(
                  controller: amountController,
                  label: 'Amount',
                  type: TextInputType.number,
                suffix: '\$'
              )),
               Expanded(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Text(expenseDate ?? 'No Date Selected'),
                     IconButton(
                         onPressed: (){
                           final now = DateTime.now();
                           final firstDate = DateTime(now.year-1,now.month,now.day);
                           showDatePicker(
                               context: context,
                               initialDate: now,
                               firstDate: firstDate,
                               lastDate: now).then((onValue) => {
                                    formatDate(onValue)
                               });
                         },
                         icon: Icon(Icons.calendar_month))
                   ],
                 ),
               )
            ],
          ),

          Row(
            children: [
              DropdownButton(
                value: selectedCategory,
                  items: Categories.values.map((e)=> DropdownMenuItem(
                      value: e,
                      child: Text(e.name.toUpperCase()))
                  ).toList(),
                  onChanged: (value){
                  chooseCategory(value);
                  }
              ),
              const Spacer(),
              TextButton(
                onPressed: (){Navigator.pop(context);},
                child: Text('Cancel'),
              ),
              OutlinedButton(
                  onPressed: (){
                    final double? enteredAmount = double.tryParse(amountController.text);
                    final bool isInvalidAmount = enteredAmount == null || enteredAmount <= 0;

                    if(titleController.text.trim().isEmpty || isInvalidAmount || expenseDate == null){
                        showDialog(context: context, builder: (ctx) => AlertDialog(
                          title: Text("Invalid Data"),
                          content: Text('Make sure that you Entered Title, Amount, Date, And Category Field '),
                          actions: [
                            TextButton(onPressed: (){Navigator.pop(ctx);}, child: Text('Okay'))
                          ],
                        ));
                    }else{
                      addExpensesItem();
                      Navigator.pop(context);
                    }
              },
                  child: Text('Save Expense'))
            ],
          )
        ],
      ),
    ),
  ),
);