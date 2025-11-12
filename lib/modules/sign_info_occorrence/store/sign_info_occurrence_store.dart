import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:sada_teste_matheus/database/occurrence_db.dart';
import 'package:sada_teste_matheus/modules/occurrence/data/models/occurrence_viewmodel.dart';

part 'sign_info_occurrence_store.g.dart';

class SignInfoOccurrenceStore = _SignInfoOccurrenceStore with _$SignInfoOccurrenceStore;

abstract class _SignInfoOccurrenceStore with Store {
  _SignInfoOccurrenceStore() {
    final ModularArguments args = Modular.args;
    if (args.data != null && args.data is Map<String, dynamic>) {
      final data = args.data as Map<String, dynamic>;
      if (data.containsKey("occurrence_viewmodel")) {
        final receivedViewModel = data["occurrence_viewmodel"] as OccurrenceViewmodel;
        _occurrenceViewmodel = receivedViewModel;
        print(_occurrenceViewmodel);
      }
    } else {
      print("Argumentos não encontrados ou não estão no formato Map.");
    }
  }

  OccurrenceViewmodel _occurrenceViewmodel = OccurrenceViewmodel(
    plate: '',
    photoBytes: Uint8List(0),
    responsibleName: '',
    responsibleSignBytes: Uint8List(0),
    dateTimeRegisterOccurrence: DateTime.now(),
    dateTimeRegisterSigned: DateTime.now(),
  );

  @observable
  TextEditingController responsibleController = TextEditingController();

  @observable
  bool isSignInfoOccurrenceFormValid = false;

  @observable
  GlobalKey<FormState> signInfoOccurrenceFormKey = GlobalKey<FormState>();

  @observable
  FocusNode responsibleFocusNode = FocusNode();

  @observable
  Uint8List signBytes = Uint8List(0);

  void onTapBackPage() {
    Modular.to.pop();
  }

  @action
  void signInfoOccurrenceChangeForm() {
    isSignInfoOccurrenceFormValid = signInfoOccurrenceFormKey.currentState!.validate() && signBytes.isNotEmpty;
  }

  @action
  void _unfocusResponsible() {
    responsibleFocusNode.unfocus();
  }

  @action
  Future<void> onTapSignOccurrence() async {
    _unfocusResponsible();
    final bytes = await Modular.to.pushNamed("sign_occurrence_page");
    if (bytes != null) {
      signBytes = bytes as Uint8List;
      signInfoOccurrenceChangeForm();
    }
  }

  @action
  void onTapFinalizeOccurrenceButton() {
    _populateOccurrenceModel();
    _saveDataOfflineSqlite();
  }

  void _populateOccurrenceModel() {
    _occurrenceViewmodel.responsibleName = responsibleController.text;
    _occurrenceViewmodel.dateTimeRegisterSigned = DateTime.now();
    _occurrenceViewmodel.responsibleSignBytes = signBytes;
  }

  Future<void> _saveDataOfflineSqlite() async {
    await OccurrenceDatabase.saveOccurrenceOffline(_occurrenceViewmodel);
    Modular.to.pushNamed('success_occurrence_store', arguments: {"occurrence_viewmodel": _occurrenceViewmodel});
  }
}
