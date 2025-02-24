import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

final uuid = Uuid();
enum Categories {food, travel, clothes, medicine, work}
final  dateFormat = DateFormat.yMd();

const  categoryIcons = {
  Categories.food : Icons.lunch_dining_outlined,
  Categories.clothes : Icons.shopping_cart,
  Categories.work : Icons.work,
  Categories.medicine : Icons.medical_information,
  Categories.travel : Icons.travel_explore,
};

class Expenses {
  final String id;
  final String productName;
  final double amount;
  final DateTime date;
  final Categories categories;

  String get formatedDate {
        return dateFormat.format(date);
  }

  Expenses({
    required this.productName,
    required this.amount,
    required this.date,
    required this.categories,
  }) : id = uuid.v4();
}