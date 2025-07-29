import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'dart:io' show Platform;
import './models/database_provider.dart';
import './models/theme_provider.dart';
// Screens
import './screens/category_screen.dart';
import './screens/expense_screen.dart';
import './screens/all_expenses.dart';

void main() {
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DatabaseProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Expense Tracker',
          themeMode: themeProvider.themeMode ?? ThemeMode.system,
          theme: _buildLightTheme(),
          darkTheme: _buildDarkTheme(),
          initialRoute: CategoryScreen.name,
          routes: {
            CategoryScreen.name: (_) => const CategoryScreen(),
            ExpenseScreen.name: (_) => const ExpenseScreen(),
            AllExpenses.name: (_) => const AllExpenses(),
          },
          onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(child: Text('Page not found')),
            ),
          ),
        );
      },
    );
  }

  ThemeData _buildLightTheme() {
    final base = ThemeData.light();
    const primaryYellow = Color(0xFFF9D976); // calm light yellow
    const secondaryWarm = Color(0xFFF39C12); // deeper yellow-orange

    return base.copyWith(
      primaryColor: primaryYellow,
      scaffoldBackgroundColor: const Color(0xFFFFF9E6), // soft cream
      cardColor: const Color(0xFFFFFDE7), // pale yellow card background
      colorScheme: const ColorScheme.light(
        primary: primaryYellow,
        secondary: secondaryWarm,
        background: Color(0xFFFFF9E6),
        surface: Color(0xFFFFFDE7),
        onPrimary: Colors.black87,
        onSecondary: Colors.black87,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryYellow,
        foregroundColor: Colors.black87,
        elevation: 2,
      ),
      textTheme: base.textTheme.apply(
        bodyColor: Colors.brown.shade800,
        displayColor: Colors.brown.shade800,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: secondaryWarm,
          foregroundColor: Colors.white,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Color(0xFFFFFDE7),
        labelStyle: TextStyle(color: Colors.brown),
        border: OutlineInputBorder(),
      ),
    );
  }

  ThemeData _buildDarkTheme() {
    final base = ThemeData.dark();
    const primaryDarkYellow = Color(0xFFB28500); // warm mustard dark
    const secondaryDark = Color(0xFFC67C00); // dark goldenrod

    return base.copyWith(
      primaryColor: primaryDarkYellow,
      scaffoldBackgroundColor: const Color(0xFF3E2F00), // dark brownish yellow
      cardColor: const Color(0xFF5A4600), // darker golden card
      colorScheme: const ColorScheme.dark(
        primary: primaryDarkYellow,
        secondary: secondaryDark,
        background: Color(0xFF3E2F00),
        surface: Color(0xFF5A4600),
        onPrimary: Colors.black87,
        onSecondary: Colors.black87,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryDarkYellow,
        foregroundColor: Colors.black87,
        elevation: 2,
      ),
      textTheme: base.textTheme.apply(
        bodyColor: Colors.amber.shade200,
        displayColor: Colors.amber.shade200,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: secondaryDark,
          foregroundColor: Colors.black87,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Color(0xFF5A4600),
        labelStyle: TextStyle(color: Colors.amberAccent),
        border: OutlineInputBorder(),
      ),
    );
  }
}
