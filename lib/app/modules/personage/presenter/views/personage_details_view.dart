import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/personage_details_bloc.dart';
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

class _PersonageDetailsViewState extends ModularState<PersonageDetailsView, PersonageDetailsBloc> {
  @override
  void initState() {
    controller.add(PersonageDetailsFetchEvent(id: widget.personageId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          // title: const Text(""),
          // backgroundColor: Colors.transparent,
          ),
      body: SingleChildScrollView(
        child: BlocBuilder<PersonageDetailsBloc, PersonageDetailsState>(
          bloc: controller,
          builder: (context, state) {
            switch (state.runtimeType) {
              case PersonageDetailsSuccessState:
                state as PersonageDetailsSuccessState;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Hero(
                      tag: widget.personageId,
                      child: Container(
                        height: height * 0.35,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(state.personage.image),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          PersonageTopText(
                            title: state.personage.name,
                            subtitle: state.personage.author ?? "",
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              state.personage.description,
                              style: const TextStyle(
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

              case PersonageDetailsLoadingState:
                return ListView.separated(
                  itemCount: (MediaQuery.of(context).size.height ~/ 220.0),
                  padding: const EdgeInsets.all(10.0),
                  shrinkWrap: true,
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 25,
                  ),
                  itemBuilder: (_, __) => Container(),
                );

              case PersonageDetailsErrorState:
                state as PersonageDetailsErrorState;
                return Center(
                  child: Text(state.error),
                );

              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
