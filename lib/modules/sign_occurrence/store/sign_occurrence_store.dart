import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:signature/signature.dart';

part 'sign_occurrence_store.g.dart';

class SignOccurrenceStore = _SignOccurrenceStore with _$SignOccurrenceStore;

abstract class _SignOccurrenceStore with Store {
  _SignOccurrenceStore() {
    signController.addListener(_updateSignatureState);
  }

  final SignatureController signController = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  @observable
  bool _isDrawingPresent = false;

  @computed
  bool get canConfirmSignature => _isDrawingPresent;

  void onTapBackPage() {
    _disposeListener();
    Modular.to.pop();
  }

  @action
  void cleanSign() {
    signController.clear();
  }

  void _disposeListener() {
    signController.removeListener(_updateSignatureState);
  }

  @action
  void _updateSignatureState() {
    _isDrawingPresent = signController.isNotEmpty;
  }

  @action
  Future<void> onTapConfirmSignedOccurrence() async {
    final Uint8List? signatureBytes = await signController.toPngBytes();
    if (signatureBytes != null) {
      _disposeListener();
      Modular.to.pop(signatureBytes);
    }
  }
}
