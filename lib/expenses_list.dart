import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.5,
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => ExpenseItem(expenses[index]),
      ),
    );
  }
}
