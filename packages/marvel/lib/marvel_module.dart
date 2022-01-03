import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel/app/modules/personage/personage_module.dart';

class MarvelModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: PersonageModule()),
      ];
}
