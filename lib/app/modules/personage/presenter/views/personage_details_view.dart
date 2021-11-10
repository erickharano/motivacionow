import 'package:flutter/material.dart';

class PersonageDetailsView extends StatelessWidget {
  const PersonageDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Container(
              height: height * 0.35,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/topImage.jpg"),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
