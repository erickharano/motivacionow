import 'package:flutter_modular/flutter_modular.dart';

import 'submodules/comics/domain/entities/comics.dart';
import 'presenter/views/personage_details_view.dart';

class PersonageModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => Comics),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const PersonageDetailsView()),
      ];
}

// [ API ]
// http://marvel.com
// /v1/personage
// /v1/comics