import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/category_screen/CategoriesLoader.dart';
import '../widgets/ExpenseEntryForm.dart';
import '../models/theme_provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static const routeName = '/category-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        centerTitle: true,
        actions: const [_ThemeToggleButton()],
      ),
      body: const CategoryFetcher(),
      floatingActionButton: const _AddExpenseButton(),
    );
  }
}

class _ThemeToggleButton extends StatelessWidget {
  const _ThemeToggleButton();

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return IconButton(
      icon: Icon(
        themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
      ),
      tooltip: themeProvider.isDarkMode ? 'Light Mode' : 'Dark Mode',
      onPressed: () {
        themeProvider.toggleTheme(!themeProvider.isDarkMode);
      },
    );
  }
}

class _AddExpenseButton extends StatelessWidget {
  const _AddExpenseButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (_) => const ExpenseForm(),
        );
      },
      child: const Icon(Icons.add),
      tooltip: 'Add Expense',
    );
  }
}
