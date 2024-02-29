import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final dateFormatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _datePicker() async {
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(
            DateTime.now().year - 1, DateTime.now().month, DateTime.now().day),
        lastDate: DateTime.now());
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(label: Text('Title')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: Text('Amount'), prefixText: 'Rs. '),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(_selectedDate == null
                      ? 'No date selected'
                      : dateFormatter.format(_selectedDate!)),
                  IconButton(
                      onPressed: _datePicker, icon: Icon(Icons.calendar_month))
                ]),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              ElevatedButton(
                onPressed: () {},
                child: Text('Save changes'),
              )
            ],
          )
        ],
      ),
    );
  }
}
