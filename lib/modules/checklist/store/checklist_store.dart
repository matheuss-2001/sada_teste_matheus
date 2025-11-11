import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'checklist_store.g.dart';

class ChecklistStore = _ChecklistStore with _$ChecklistStore;

abstract class _ChecklistStore with Store {
  @action
  void startChecklist() {
    Modular.to.pushNamed('occurrence_info_page');
  }
}
