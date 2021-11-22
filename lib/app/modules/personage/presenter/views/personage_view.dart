import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../utils_widget.dart';
import '../../domain/dtos/personage_dto.dart';
import '../bloc/personage_bloc.dart';
import '../widgets/personage_list_shimmer.dart';
import '../widgets/personage_list.dart';

class PersonageView extends StatefulWidget {
  const PersonageView({Key? key}) : super(key: key);

  @override
  State<PersonageView> createState() => _PersonageViewState();
}

class _PersonageViewState extends ModularState<PersonageView, PersonageBloc> {
  late ScrollController _scrollController;

  ValueNotifier<PersonageDTO> params = ValueNotifier(
    PersonageDTO(
      offset: 0,
      limit: 20,
    ),
  );

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    controller.add(PersonageFetchEvent(params: params.value));
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    final state = controller.state;
    final offset = params.value.offset;
    if (_isBottom && state is PersonageSuccessState && !state.isLoading) {
      params.value = params.value.copyWith(offset: offset + 20);
      controller.add(
        PersonagePaginateEvent(
          params: params.value,
        ),
      );
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "MARVEL",
          style: TextStyle(
            fontSize: 35,
            color: AppTheme.cBlack,
            fontWeight: FontWeight.w900,
            letterSpacing: -2.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: AppTheme.cBlack,
            ),
          ),
        ],
      ),
      body: BlocBuilder<PersonageBloc, PersonageState>(
        bloc: controller,
        builder: (context, state) {
          switch (state.runtimeType) {
            case PersonageSuccessState:
              state as PersonageSuccessState;
              if (state.personages.isEmpty) {
                return const Center(
                  child: Text('No Personages.'),
                );
              }

              return ListView.separated(
                controller: _scrollController,
                padding: const EdgeInsets.all(10.0),
                shrinkWrap: true,
                itemCount: state.personages.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index >= state.personages.length) {
                    return Visibility(
                      child: const Center(),
                      visible: !state.hasMax,
                      replacement: const SizedBox.shrink(),
                    );
                  }

                  return PersonageList(
                    personage: state.personages[index],
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(
                  height: 25,
                ),
              );
            case PersonageErrorState:
              state as PersonageErrorState;
              return Center(
                child: Text(state.error),
              );

            case PersonageLoadingState:
              return ListView.separated(
                itemCount: (MediaQuery.of(context).size.height ~/ 220.0),
                padding: const EdgeInsets.all(10.0),
                shrinkWrap: true,
                separatorBuilder: (_, __) => const SizedBox(
                  height: 25,
                ),
                itemBuilder: (_, __) => const PersonageListShimmer(),
              );

            default:
              return Container();
          }
        },
      ),
    );
  }
}
