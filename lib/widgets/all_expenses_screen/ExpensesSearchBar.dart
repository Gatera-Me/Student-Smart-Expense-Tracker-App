import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/database_provider.dart';

class ExpensesSearchBar extends StatefulWidget {
  const ExpensesSearchBar({super.key});

  @override
  State<ExpensesSearchBar> createState() => _ExpensesSearchBarState();
}

class _ExpensesSearchBarState extends State<ExpensesSearchBar> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return TextField(
      onChanged: (value) {
        provider.searchText = value;
      },
      decoration: const InputDecoration(
        labelText: 'Search Expenses',
      ),
    );
  }
}
