import 'package:flutter_modular/flutter_modular.dart';
import 'package:sada_teste_matheus/modules/sign_occurrence/page/sign_occurrence_page.dart';
import 'package:sada_teste_matheus/modules/sign_occurrence/store/sign_occurrence_store.dart';


class SignOccurrenceModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(() => SignOccurrenceStore());
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SignOccurrencePage());
  }
}
