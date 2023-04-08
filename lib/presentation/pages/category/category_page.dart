import 'package:flutter/material.dart';

import 'body.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  static String routeName = "/category";

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    final categoryName = ModalRoute.of(context)!.settings.arguments as String;

    return Body(categoryName: categoryName);
  }
}
