import 'package:flutter_modular/flutter_modular.dart';
import 'package:sada_teste_matheus/modules/success_occurrence/page/success_occurrence_page.dart';
import 'package:sada_teste_matheus/modules/success_occurrence/store/success_occurrence_store.dart';

class SuccessOccurrenceModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(() => SuccessOccurrenceStore());
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SuccessOccurrencePage());
  }
}
