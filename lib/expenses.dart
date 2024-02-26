import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter Demo',
        amount: 500,
        date: DateTime.now(),
        category: Category.work),
    Expense(
      title: 'Flutter Demo',
      amount: 500,
      date: DateTime.now(),
      category: Category.leisure),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Column(
          children: [
            const Text('The chart'),
            ExpensesList(expenses: _registeredExpenses),
          ],
        ),
      ),
    );
  }
}
