import 'package:flutter/material.dart';
import '../models/expenses_model.dart';

Widget expensesItem ({required List<Expenses> model, required int index}) => Card.outlined(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(model[index].productName),

        Row(
          children: [
            Text('${model[index].amount}\$'),
            const Spacer(),
            Row(
              children: [
                Icon(categoryIcons[model[index].categories]),
                SizedBox(width: 10,),
                Text(model[index].formatedDate)
              ],
            )
          ],
        )
      ],
    ),
  ),
);