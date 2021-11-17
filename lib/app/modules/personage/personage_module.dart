import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core/adapters/http_client/http_client_adapter_impl.dart';
import '../core/helpers/marvel/marvel_hash.dart';
import '../core/helpers/url/personage_endpoint.dart';
import 'domain/usecases/personage_usecase_impl.dart';
import 'external/datasources/personage_remote_datasource_impl.dart';
import 'infra/repositories/personage_repository_impl.dart';
import 'presenter/bloc/personage_bloc.dart';
import 'presenter/views/personage_view.dart';
import 'presenter/views/personage_details_view.dart';

class PersonageModule extends Module {
  var time = (DateTime.now().microsecondsSinceEpoch).toString();

  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) => Dio(
            BaseOptions(
              baseUrl: PersonageEndpoint.urlBase,
              queryParameters: {
                'ts': time,
                'apikey': dotenv.env['MARVEL_PUBLIC_KEY'],
                'hash': MarvelHash(
                  private: dotenv.env['MARVEL_PRIVATE_KEY'] ?? "",
                  public: dotenv.env['MARVEL_PUBLIC_KEY'] ?? "",
                  timestamp: time,
                ).createHash(),
              },
            ),
          ),
        ),
        Bind((i) => HttpClientAdapterImpl(dio: i.get())),
        Bind((i) => PersonageRemoteDatasourceImpl(httpClient: i.get())),
        Bind((i) => PersonageRepositoryImpl(datasource: i.get())),
        Bind((i) => PersonageUsecaseImpl(repository: i.get())),
        Bind((i) => PersonageBloc(usecase: i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const PersonageView()),
        ChildRoute('/details/:id',
            child: (context, args) => PersonageDetailsView(
                  personageId: int.parse(args.params['id']),
                )),
      ];
}
