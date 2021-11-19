import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/personage_bloc.dart';
import '../widgets/personage_top_text.dart';

class PersonageDetailsView extends StatefulWidget {
  final int personageId;

  const PersonageDetailsView({
    Key? key,
    required this.personageId,
  }) : super(key: key);

  @override
  State<PersonageDetailsView> createState() => _PersonageDetailsViewState();
}

class _PersonageDetailsViewState extends ModularState<PersonageDetailsView, PersonageBloc> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.personageId.toString()),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<PersonageBloc, PersonageState>(
          bloc: controller,
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Hero(
                  tag: widget.personageId,
                  child: Container(
                    height: height * 0.35,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("images/topImage.jpg"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const PersonageTopText(
                        title: "Wolverine",
                        subtitle: "Logan",
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Description asjdh aiusdh aiusdh iausdh uiash duiashdiuasd uiahsdiu ahsdiu hasudi haisu dhaius dhauisdhauisdh iaudh iaudh iuasdh iaushd iuasdh ahjsd aksdh kjash doaiusdoquw eoquczxcbzcb zcbmn zbcm zbx asjdh aiusdh aiusdh iausdh uiash duiashdiuasd uiahsdiu ahsdiu hasudi haisu dhaius dhauisdhauisdh iaudh iaudh iuasdh iaushd iuasdh ahjsd aksdh kjash doaiusdoquw eoquczxcbzcb zcbmn zbcm zbx " +
                              " Description asjdh aiusdh aiusdh iausdh uiash duiashdiuasd uiahsdiu ahsdiu hasudi haisu dhaius dhauisdhauisdh iaudh iaudh iuasdh iaushd iuasdh ahjsd aksdh kjash doaiusdoquw eoquczxcbzcb zcbmn zbcm zbx asjdh aiusdh aiusdh iausdh uiash duiashdiuasd uiahsdiu ahsdiu hasudi haisu dhaius dhauisdhauisdh iaudh iaudh iuasdh iaushd iuasdh ahjsd aksdh kjash doaiusdoquw eoquczxcbzcb zcbmn zbcm zbx ",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Comics",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 55,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => const SizedBox(width: 5.0),
                          shrinkWrap: true,
                          itemCount: 20,
                          itemBuilder: (_, index) => Container(
                            width: 50,
                            height: 50,
                            color: Colors.red,
                            child: Text(index.toString()),
                          ),
                        ),
                      ),
                      // GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder)
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
