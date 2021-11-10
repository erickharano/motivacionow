import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:motivacionow/app/modules/personage/personage_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) => Dio(
            BaseOptions(
              baseUrl: 'http://marvel.com',
            ),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: PersonageModule()),
      ];
}
