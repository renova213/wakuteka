import 'package:flutter/material.dart';

import '../../../presentation.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback pressSeeAll;
  const SectionTitle(
      {super.key, required this.title, required this.pressSeeAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.body1Medium,
        ),
        TextButton(
          onPressed: pressSeeAll,
          child: const Text("See All", style: TextStyle(color: Colors.black54)),
        ),
      ],
    );
  }
}
