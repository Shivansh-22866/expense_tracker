import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/new_expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
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

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => NewExpense(
              onAddExpense: _addExpense,
            ));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final int index = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Expense removed'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(index, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      heightFactor: 20,
      child: Text('Add new expenses here'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Expense Tracker"), actions: [
        IconButton(
            onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
      ]),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          mainContent,
        ],
      ),
    );
  }
}
