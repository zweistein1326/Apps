import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final String description;
  final double amount;
  final DateTime date;

  Transaction(
      {@required this.id,
      @required this.amount,
      @required this.description,
      @required this.date,
      @required this.title
      }
    );
}
