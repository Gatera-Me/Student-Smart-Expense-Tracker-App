import 'package:flutter/material.dart';
import '../constants/icons.dart';

class ExpenseCategory {
  final String title;
  int entries;
  double totalAmount;
  final IconData icon;

  ExpenseCategory({
    required this.title,
    required this.entries,
    required this.totalAmount,
    required this.icon,
  });

  Map<String, dynamic> toMap() => {
    'title': title,
    'entries': entries,
    'totalAmount': totalAmount.toString(),
  };

  factory ExpenseCategory.fromString(Map<String, dynamic> map) {
    return ExpenseCategory(
      title: map['title'],
      entries: map['entries'],
      totalAmount: double.parse(map['totalAmount']),
      icon: icons[map['title']]!,
    );
  }
}
