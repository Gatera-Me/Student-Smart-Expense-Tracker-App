import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../models/database_provider.dart';
import '../constants/icons.dart';
import '../models/expense.dart';

class ExpenseEntryForm extends StatefulWidget {
  final Expense? expense;
  const ExpenseEntryForm({super.key, this.expense});

  @override
  State<ExpenseEntryForm> createState() => _ExpenseEntryFormState();
}

class _ExpenseEntryFormState extends State<ExpenseEntryForm> {
  final _title = TextEditingController();
  final _amount = TextEditingController();
  DateTime? _date;
  String _selectedCategory = 'Other';

  @override
  void initState() {
    super.initState();
    if (widget.expense != null) {
      _title.text = widget.expense!.title;
      _amount.text = widget.expense!.amount.toString();
      _date = widget.expense!.date;
      _selectedCategory = widget.expense!.category;
    }
  }

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _date ?? DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _date = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // title
            TextField(
              controller: _title,
              decoration: const InputDecoration(
                labelText: 'Title of expense',
              ),
            ),
            const SizedBox(height: 20.0),
            // amount
            TextField(
              controller: _amount,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount of expense',
              ),
            ),
            const SizedBox(height: 20.0),
            // date picker
            Row(
              children: [
                Expanded(
                  child: Text(_date != null
                      ? DateFormat('MMMM dd, yyyy').format(_date!)
                      : 'Select Date'),
                ),
                IconButton(
                  onPressed: _pickDate,
                  icon: const Icon(Icons.calendar_month),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            // category dropdown
            Row(
              children: [
                const Expanded(child: Text('Category')),
                Expanded(
                  child: DropdownButton<String>(
                    items: icons.keys
                        .map(
                          (e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ),
                    )
                        .toList(),
                    value: _selectedCategory,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedCategory = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: () {
                if (_title.text.isNotEmpty && _amount.text.isNotEmpty) {
                  final expense = Expense(
                    id: widget.expense?.id ?? 0,
                    title: _title.text,
                    amount: int.parse(_amount.text),
                    date: _date ?? DateTime.now(),
                    category: _selectedCategory,
                  );
                  if (widget.expense == null) {
                    provider.addExpense(expense);
                  } else {
                    provider.updateExpense(expense);
                  }
                  Navigator.of(context).pop();
                }
              },
              icon: Icon(widget.expense == null ? Icons.add : Icons.edit),
              label: Text(widget.expense == null ? 'Add Expense' : 'Update Expense'),
            ),
          ],
        ),
      ),
    );
  }
}
