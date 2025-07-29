import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/database_provider.dart';
import '../expense_screen/expense_card.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (_, db, __) {
        var expenses = db.expenses;
        return expenses.isNotEmpty
            ? ListView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: expenses.length,
          itemBuilder: (_, i) => ExpenseCard(expenses[i]),
        )
            : const Center(
          child: Text('No Entries Found'),
        );
      },
    );
  }
}
