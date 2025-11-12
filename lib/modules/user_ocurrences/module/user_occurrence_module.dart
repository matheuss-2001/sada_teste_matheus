import 'package:flutter_modular/flutter_modular.dart';
import 'package:sada_teste_matheus/modules/user_ocurrences/page/user_occurrence_detail.dart';
import 'package:sada_teste_matheus/modules/user_ocurrences/page/user_occurrence_page.dart';
import 'package:sada_teste_matheus/modules/user_ocurrences/store/user_occurrence_store.dart';

class UserOccurrenceModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(() => UserOccurrenceStore());
  }

  @override
  void routes(r) {
    r.child('/user_occurrence_detail', child: (context) => const UserOccurrenceDetail());
    r.child('/', child: (context) => const UserOccurrencePage());
  }
}
