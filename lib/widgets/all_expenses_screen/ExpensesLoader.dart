import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/database_provider.dart';
import './expenses_list.dart';
import './expenses_search_bar.dart';

class ExpensesLoader extends StatefulWidget {
  const ExpensesLoader({super.key});

  @override
  State<ExpensesLoader> createState() => _ExpensesLoaderState();
}

class _ExpensesLoaderState extends State<ExpensesLoader> {
  late Future _expensesListFuture;

  Future _fetchAllExpenses() async {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return await provider.fetchAllExpenses();
  }

  @override
  void initState() {
    super.initState();
    _expensesListFuture = _fetchAllExpenses();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _expensesListFuture,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  ExpensesSearchBar(),
                  Expanded(child: ExpensesList()),
                ],
              ),
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
