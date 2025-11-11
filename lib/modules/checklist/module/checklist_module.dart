import 'package:flutter_modular/flutter_modular.dart';
import 'package:sada_teste_matheus/modules/checklist/page/checklist_page.dart';
import 'package:sada_teste_matheus/modules/checklist/store/checklist_store.dart';
import 'package:sada_teste_matheus/modules/occurrence/module/occurrence_module.dart';

class ChecklistModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(() => ChecklistStore());
  }

  @override
  void routes(r) {
    r.module('/occurrence_info_page', module: OccurrenceModule());
    r.child('/', child: (context) => const ChecklistPage());
  }
}
