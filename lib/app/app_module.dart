import 'package:flutter_modular/flutter_modular.dart';
import 'package:sada_teste_matheus/modules/checklist/module/checklist_module.dart';



class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module('/', module: ChecklistModule());
  }
}