import 'package:flutter/material.dart';

import '../../../../utils_widget.dart';

class PersonageTopText extends StatelessWidget {
  final String title;
  final String subtitle;

  const PersonageTopText({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppTheme.cBlack,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 18,
          color: AppTheme.cBlack,
        ),
      ),
      trailing: const Icon(
        Icons.favorite_border,
      ),
    );
  }
}
