import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/dtos/personage_dto.dart';
import '../bloc/personage_bloc.dart';
import '../widgets/personage_list.dart';

class PersonageView extends StatefulWidget {
  const PersonageView({Key? key}) : super(key: key);

  @override
  State<PersonageView> createState() => _PersonageViewState();
}

class _PersonageViewState extends ModularState<PersonageView, PersonageBloc> {
  final _scrollController = ScrollController();

  ValueNotifier<PersonageDTO> params = ValueNotifier(
    PersonageDTO(
      page: 1,
      perPage: 10,
    ),
  );

  @override
  void initState() {
    super.initState();
    controller.add(PersonageFetchEvent(params: params.value));
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    final state = Modular.get<PersonageState>();
    final page = params.value.page;
    if (_isBottom && state is PersonageSuccessState && !state.isLoading) {
      params.value = params.value.copyWith(page: page + 1);
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
        title: const Text(
          "Listagem de Personagens",
        ),
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

              return ListView.builder(
                controller: _scrollController,
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

                  return PersonageListItem(
                    personage: state.personages[index],
                  );
                },
              );
            case PersonageErrorState:
              state as PersonageErrorState;
              return Center(
                child: Text(state.error),
              );

            case PersonageLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );

            default:
              return Container();
          }
        },
      ),
    );
  }
}
