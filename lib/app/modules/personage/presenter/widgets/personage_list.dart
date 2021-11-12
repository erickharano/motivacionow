import 'package:flutter/material.dart';
import 'package:motivacionow/app/modules/personage/domain/entities/personage.dart';

import '../../../../utils_widget.dart';

class PersonageListItem extends StatelessWidget {
  final Personage personage;

  const PersonageListItem({
    Key? key,
    required this.personage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          child: Row(
            children: [
              Text(
                personage.name,
              ),
            ],
          ),
        ),
      ],
    );

    // return ListTile(
    //   leading: const Image(
    //     // image: NetworkImage(imageUri),
    //     image: AssetImage("images/image-1.png"),
    //     height: 150,
    //     width: 100,
    //   ),
    //   title: Text(
    //     personage.name,
    //     style: const TextStyle(
    //       fontSize: 22,
    //       fontWeight: FontWeight.bold,
    //       color: AppTheme.cBlack,
    //     ),
    //   ),
    //   subtitle: Text(
    //     personage.author ?? "",
    //     style: const TextStyle(
    //       fontSize: 18,
    //       color: AppTheme.cBlack,
    //     ),
    //   ),
    //   trailing: const Icon(Icons.keyboard_arrow_right_outlined),
    // );
  }
}
