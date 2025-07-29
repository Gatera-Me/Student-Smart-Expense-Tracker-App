import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/database_provider.dart';
import './ExpensesPieChart.dart';
import './CategoryList.dart';
import '../../screens/all_expenses.dart';

class CategoriesLoader extends StatefulWidget {
  const CategoriesLoader({super.key});

  @override
  State<CategoriesLoader> createState() => _CategoriesLoaderState();
}

class _CategoriesLoaderState extends State<CategoriesLoader> {
  late Future _categoriesFuture;

  Future _fetchCategories() async {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return await provider.fetchCategories();
  }

  @override
  void initState() {
    super.initState();
    _categoriesFuture = _fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _categoriesFuture,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 220.0,
                          child: ExpensesPieChart(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Expenses by Category',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AllExpenses.name);
                      },
                      child: const Text('View All'),
                    ),
                  ],
                ),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: SizedBox(
                    height: 200,
                    child: const CategoriesList(),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Recent Expenses',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: SizedBox(
                    height: 180,
                    child: _RecentExpensesList(),
                  ),
                ),
              ],
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _RecentExpensesList extends StatelessWidget {
  const _RecentExpensesList();

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (_, db, __) {
        final recent = db.expenses.length > 5
            ? db.expenses.sublist(db.expenses.length - 5).reversed.toList()
            : db.expenses.reversed.toList();
        if (recent.isEmpty) {
          return const Center(child: Text('No recent expenses.'));
        }
        return ListView.separated(
          itemCount: recent.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (_, i) {
            final exp = recent[i];
            return ListTile(
              leading: Icon(Icons.monetization_on, color: Theme.of(context).colorScheme.primary),
              title: Text(exp.title),
              subtitle: Text('${exp.category} • ${exp.date.toLocal().toString().split(' ')[0]}'),
              trailing: Text('FRw ${exp.amount}'),
            );
          },
        );
      },
    );
  }
}
