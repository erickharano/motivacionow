import 'package:flutter/material.dart';

import 'modules/personage/presenter/views/personage_details_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const PersonageDetails(),
          ],
        ),
      ),
    );
  }
}
