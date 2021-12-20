import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:motivacionow/app/core/helpers/errors/datasource_error.dart';
import 'package:motivacionow/app/core/helpers/errors/http_client_error.dart';
import 'package:motivacionow/app/modules/personage/presenter/bloc/personage_bloc.dart';

import '../../mock.dart';

// class MockCounterBloc extends MockBloc<CounterEvent, int> implements CounterBloc {}
// class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
  late PersonageUsecaseMock usecase;
  late PersonageFetchEvent eventFetch;
  late PersonagePaginateEvent eventPage;
  late PersonageDTOFake params;
  late List<Personage> response;
  late DataSourceError dataSourceError;

  setUpAll(() {
    usecase = PersonageUsecaseMock();
    params = PersonageDTOFake();
    eventFetch = PersonageFetchEvent(params: params);
    eventPage = PersonagePaginateEvent(params: params);

    response = List.generate(10, (index) => PersonageFake());
    dataSourceError = DataSourceError(
      message: "Erro",
      stackTrace: StackTrace.current,
    );
  });

  group("teste do bloc fetch event", () {
    blocTest<PersonageBloc, PersonageState>(
      "teste de sucesso",
      build: () => PersonageBloc(usecase: usecase),
      act: (bloc) async {
        when(() => usecase.call(params: params))
            .thenAnswer((invocation) async => Right(response));

        bloc.add(eventFetch);
      },
      expect: () => [
        isA<PersonageLoadingState>(),
        isA<PersonageSuccessState>(),
      ],
    );

    blocTest<PersonageBloc, PersonageState>(
      "teste de erro",
      build: () => PersonageBloc(usecase: usecase),
      act: (bloc) async {
        when(() => usecase.call(params: params))
            .thenAnswer((invocation) async => Left(dataSourceError));

        bloc.add(eventFetch);
      },
      expect: () => [
        isA<PersonageLoadingState>(),
        isA<PersonageErrorState>(),
      ],
    );
  });

  group("teste do bloc paginate event", () {
    // blocTest<PersonageBloc, PersonageState>(
    //   "teste de sucesso",
    //   build: () => PersonageBloc(usecase: usecase),
    //   act: (bloc) async {
    //     when(() => usecase.call(params: params))
    //         .thenAnswer((invocation) async => Right(response));

    //     bloc.add(eventPage);
    //   },
    //   seed: () => PersonageSuccessState(
    //     personages: response,
    //     hasMax: false,
    //     isLoading: false,
    //     ),
    //   expect: () => [
    //     isA<PersonageLoadingState>(),
    //     isA<PersonageSuccessState>(),
    //   ],
    // );

    blocTest<PersonageBloc, PersonageState>(
      "teste de sucesso 400 lista vazia",
      build: () => PersonageBloc(usecase: usecase),
      act: (bloc) async {
        when(() => usecase.call(params: params))
            .thenAnswer((invocation) async => Left(HttpClientError(
                  "não encontrou a rota",
                  StackTrace.current,
                  statusCode: 400,
                )));

        bloc.add(eventPage);
      },
      seed: () => PersonageSuccessState(personages: response),
      expect: () => [
        isA<PersonageSuccessState>(),
      ],
    );

    blocTest<PersonageBloc, PersonageState>(
      "teste de erro",
      build: () => PersonageBloc(usecase: usecase),
      act: (bloc) async {
        when(() => usecase.call(params: params))
            .thenAnswer((invocation) async => Left(HttpClientError(
                  "não existe a rota",
                  StackTrace.current,
                  statusCode: 500,
                )));

        bloc.add(eventPage);
      },
      seed: () => PersonageSuccessState(personages: response),
      expect: () => [
        isA<PersonageErrorState>(),
      ],
    );
  });
}
