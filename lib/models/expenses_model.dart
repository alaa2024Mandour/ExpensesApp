import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Expenses {

  final String id;
  final String productName;
  final double amount;
  final DateTime date;

  Expenses({
    required this.productName,
    required this.amount,
    required this.date
  }) : id = uuid.v4();

}