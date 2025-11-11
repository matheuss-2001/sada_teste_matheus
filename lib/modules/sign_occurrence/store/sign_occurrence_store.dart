import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:signature/signature.dart';

part 'sign_occurrence_store.g.dart';

class SignOccurrenceStore = _SignOccurrenceStore with _$SignOccurrenceStore;

abstract class _SignOccurrenceStore with Store {
  _SignOccurrenceStore() {
    final ModularArguments args = Modular.args;
    if (args.data != null && args.data is Uint8List) {
      final data = args.data as Map<String, dynamic>;
      if (data.containsKey("sign_bytes")) {
        final receivedViewModel = data["occurrence_viewmodel"] as Uint8List;
        responsibleSignBytes = receivedViewModel;
        isOccurredSigned = true;
      }
    } else {
      print("Argumentos não encontrados");
    }
  }

  Uint8List responsibleSignBytes = Uint8List(0);

  final SignatureController signController = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  @observable
  bool isOccurredSigned = false;

  void onTapBackPage() {
    Modular.to.pop();
  }

  @action
  Future<void> onTapConfirmSignedOccurrence() async {
    final Uint8List? signatureBytes = await signController.toPngBytes();
    if (signatureBytes != null) {
      Modular.to.pop(signatureBytes);
    }
  }
}
