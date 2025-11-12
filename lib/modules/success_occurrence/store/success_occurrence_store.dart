import 'dart:typed_data';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:sada_teste_matheus/modules/occurrence/data/models/occurrence_viewmodel.dart';

part 'success_occurrence_store.g.dart';

class SuccessOccurrenceStore = _SuccessOccurrenceStore with _$SuccessOccurrenceStore;

abstract class _SuccessOccurrenceStore with Store {
  _SuccessOccurrenceStore() {
    final ModularArguments args = Modular.args;
    if (args.data != null && args.data is Map<String, dynamic>) {
      final data = args.data as Map<String, dynamic>;
      if (data.containsKey("occurrence_viewmodel")) {
        final receivedViewModel = data["occurrence_viewmodel"] as OccurrenceViewmodel;
        occurrenceViewmodel = receivedViewModel;
      }
    } else {
      print("Argumentos não encontrados ou não estão no formato Map.");
    }
  }

  OccurrenceViewmodel occurrenceViewmodel = OccurrenceViewmodel(
    plate: '',
    photoBytes: Uint8List(0),
    responsibleName: '',
    responsibleSignBytes: Uint8List(0),
    dateTimeRegisterOccurrence: DateTime.now(),
    dateTimeRegisterSigned: DateTime.now(),
  );

  void onTapBackPage() {
    Modular.to.pop();
  }

  @action
  void onTapFinalizeProcess() {
    Modular.to.pushNamedAndRemoveUntil('/', (route) => false);
  }
}
