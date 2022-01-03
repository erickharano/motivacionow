import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel/marvel.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: MarvelModule()),
      ];
}
