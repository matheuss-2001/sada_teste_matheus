import 'package:flutter_modular/flutter_modular.dart';
import 'package:sada_teste_matheus/modules/sign_info_occorrence/page/sign_info_occurrence_page.dart';
import 'package:sada_teste_matheus/modules/sign_info_occorrence/store/sign_info_occurrence_store.dart';

class SignInfoOccurrenceModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(() => SignInfoOccurrenceStore());
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SignInfoOccurrencePage());
  }
}
