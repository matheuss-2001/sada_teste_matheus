import 'package:flutter_modular/flutter_modular.dart';
import 'package:sada_teste_matheus/modules/occurrence/page/occurrence_info_page.dart';
import 'package:sada_teste_matheus/modules/occurrence/store/occurrence_store.dart';
import 'package:sada_teste_matheus/modules/sign_info_occorrence/module/sign_info_occurrence_module.dart';

class OccurrenceModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(() => OccurrenceStore());
  }

  @override
  void routes(r) {
    r.module('/sign_info_occurrence_page', module: SignInfoOccurrenceModule());
    r.child('/', child: (context) => const OccurrenceInfoPage());
  }
}
