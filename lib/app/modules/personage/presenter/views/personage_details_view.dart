import 'package:flutter/material.dart';
import 'package:motivacionow/app/modules/personage/domain/entities/personage.dart';
import 'package:motivacionow/app/modules/personage/presenter/widgets/personage_top_text.dart';

import '../../../../utils_widget.dart';

class PersonageDetailsView extends StatelessWidget {
  final Personage? personage;

  const PersonageDetailsView({
    Key? key,
    this.personage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 1,
                  horizontal: 1,
                ),
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: PersonageTopText(
                        title: "Wolverine",
                        subtitle: "Logan",
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Descrição do personagem",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.cBlack,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
