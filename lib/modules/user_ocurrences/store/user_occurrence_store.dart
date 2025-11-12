import 'dart:typed_data';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:sada_teste_matheus/database/occurrence_db.dart';
import 'package:sada_teste_matheus/modules/occurrence/data/models/occurrence_viewmodel.dart';

part 'user_occurrence_store.g.dart';

class UserOccurrenceStore = _UserOccurrenceStore with _$UserOccurrenceStore;

abstract class _UserOccurrenceStore with Store {
  _UserOccurrenceStore() {
    _getListOccurrenceAvailable();
  }

  OccurrenceViewmodel occurrenceViewmodelChoose = OccurrenceViewmodel(
    plate: '',
    photoBytes: Uint8List(0),
    responsibleName: '',
    responsibleSignBytes: Uint8List(0),
    dateTimeRegisterOccurrence: DateTime.now(),
    dateTimeRegisterSigned: DateTime.now(),
  );

  List<OccurrenceViewmodel> listOccurrenceViewmodelAvailable = <OccurrenceViewmodel>[];

  @observable
  bool loadingListOccurrence = false;

  @action
  Future<void> _getListOccurrenceAvailable() async {
    loadingListOccurrence = true;
    listOccurrenceViewmodelAvailable = await OccurrenceDatabase.getListOccurrencesSaved();
    loadingListOccurrence = false;
  }

  void onTapBackPage() {
    Modular.to.pop();
  }

  void onTapDetailUserOccurrence(OccurrenceViewmodel occurrenceViewmodelChooseParam) {
    occurrenceViewmodelChoose = occurrenceViewmodelChooseParam;
    Modular.to.pushNamed('user_occurrence_detail');
  }
}
