import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final dateFormatter = DateFormat.yMd();

final uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.restaurant,
  Category.travel: Icons.local_florist,
  Category.leisure: Icons.spa,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return dateFormatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> AllExpenses, this.category) : expenses = AllExpenses.where((element) => element.category == category).toList();

  final Category category;
  final List<Expense> expenses;

  double get totalAmount {
    double sum = 0;
    for (var expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
