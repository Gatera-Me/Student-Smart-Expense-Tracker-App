import 'package:flutter/material.dart';
import '../widgets/all_expenses_screen/ExpensesLoader.dart';

class AllExpensesScreen extends StatelessWidget {
  const AllExpensesScreen({super.key});
  static const routeName = '/all-expenses';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Expenses'),
      ),
      body: const AllExpensesFetcher(),
    );
  }
}
