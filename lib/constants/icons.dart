import 'package:flutter/material.dart';

class CategoryIcon {
  final String name;
  final IconData icon;

  CategoryIcon(this.name, this.icon);
}

final List<CategoryIcon> categories = [
  CategoryIcon('Auto And Transport', Icons.train),
  CategoryIcon('Sports', Icons.sports_soccer),
  CategoryIcon('Food And Drinks', Icons.local_pizza),
  CategoryIcon('Entertainment', Icons.movie),
  CategoryIcon('Education', Icons.school),
  CategoryIcon('Other', Icons.miscellaneous_services),
];
