import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
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
  File? signFile;

  void onTapBackPage() {
    Modular.to.pop();
  }

  @action
  void signInfoOccurrenceChangeForm() {
    isSignInfoOccurrenceFormValid = signInfoOccurrenceFormKey.currentState!.validate() && signFile != null;
  }

  @action
  void _unfocusResponsible() {
    responsibleFocusNode.unfocus();
  }

  @action
  Future<void> onTapSignOccurrence() async {
    _unfocusResponsible();
  }

  @action
  void onTapFinalizeOccurrenceButton() {
    Modular.to.pushNamed('/');
  }
}
