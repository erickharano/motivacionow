import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:motivacionow/app/modules/core/adapters/http_client/http_client_adapter_impl.dart';
import 'package:motivacionow/app/modules/core/helpers/marvel/marvel_hash.dart';
import 'package:motivacionow/app/modules/core/helpers/url/personage_endpoint.dart';
import 'package:motivacionow/app/modules/personage/personage_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) => Dio(
            BaseOptions(
              baseUrl: PersonageEndpoint.urlBase,
              queryParameters: {
                'ts': DateTime.now(),
                'publicKey': dotenv.env['MARVEL_PUBLIC_KEY'],
                'hash': MarvelHash(
                  private: dotenv.env['MARVEL_PRIVATE_KEY'] ?? "",
                  public: dotenv.env['MARVEL_PUBLIC_KEY'] ?? "",
                  timestamp: DateTime.now().toString(),
                ).createHash(),
              },
            ),
          ),
        ),
        Bind((i) => HttpClientAdapterImpl(dio: i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: PersonageModule()),
      ];
}
