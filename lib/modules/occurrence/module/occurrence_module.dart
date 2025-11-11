import 'package:flutter_modular/flutter_modular.dart';
import 'package:sada_teste_matheus/modules/occurrence/page/occurrence_info_page.dart';
import 'package:sada_teste_matheus/modules/occurrence/store/occurrence_store.dart';

class OccurrenceModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(() => OccurrenceStore());
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const OccurrenceInfoPage());
  }
}
