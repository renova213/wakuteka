import 'package:flutter/material.dart';

import 'body.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  static String routeName = "/search";

  @override
  State<SearchPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final productName = ModalRoute.of(context)!.settings.arguments as String;

    return Body(input: productName);
  }
}
