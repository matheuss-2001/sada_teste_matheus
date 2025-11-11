// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_info_occurrence_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInfoOccurrenceStore on _SignInfoOccurrenceStore, Store {
  late final _$responsibleControllerAtom = Atom(
    name: '_SignInfoOccurrenceStore.responsibleController',
    context: context,
  );

  @override
  TextEditingController get responsibleController {
    _$responsibleControllerAtom.reportRead();
    return super.responsibleController;
  }

  @override
  set responsibleController(TextEditingController value) {
    _$responsibleControllerAtom.reportWrite(
      value,
      super.responsibleController,
      () {
        super.responsibleController = value;
      },
    );
  }

  late final _$isSignInfoOccurrenceFormValidAtom = Atom(
    name: '_SignInfoOccurrenceStore.isSignInfoOccurrenceFormValid',
    context: context,
  );

  @override
  bool get isSignInfoOccurrenceFormValid {
    _$isSignInfoOccurrenceFormValidAtom.reportRead();
    return super.isSignInfoOccurrenceFormValid;
  }

  @override
  set isSignInfoOccurrenceFormValid(bool value) {
    _$isSignInfoOccurrenceFormValidAtom.reportWrite(
      value,
      super.isSignInfoOccurrenceFormValid,
      () {
        super.isSignInfoOccurrenceFormValid = value;
      },
    );
  }

  late final _$signInfoOccurrenceFormKeyAtom = Atom(
    name: '_SignInfoOccurrenceStore.signInfoOccurrenceFormKey',
    context: context,
  );

  @override
  GlobalKey<FormState> get signInfoOccurrenceFormKey {
    _$signInfoOccurrenceFormKeyAtom.reportRead();
    return super.signInfoOccurrenceFormKey;
  }

  @override
  set signInfoOccurrenceFormKey(GlobalKey<FormState> value) {
    _$signInfoOccurrenceFormKeyAtom.reportWrite(
      value,
      super.signInfoOccurrenceFormKey,
      () {
        super.signInfoOccurrenceFormKey = value;
      },
    );
  }

  late final _$responsibleFocusNodeAtom = Atom(
    name: '_SignInfoOccurrenceStore.responsibleFocusNode',
    context: context,
  );

  @override
  FocusNode get responsibleFocusNode {
    _$responsibleFocusNodeAtom.reportRead();
    return super.responsibleFocusNode;
  }

  @override
  set responsibleFocusNode(FocusNode value) {
    _$responsibleFocusNodeAtom.reportWrite(
      value,
      super.responsibleFocusNode,
      () {
        super.responsibleFocusNode = value;
      },
    );
  }

  late final _$signFileAtom = Atom(
    name: '_SignInfoOccurrenceStore.signFile',
    context: context,
  );

  @override
  File? get signFile {
    _$signFileAtom.reportRead();
    return super.signFile;
  }

  @override
  set signFile(File? value) {
    _$signFileAtom.reportWrite(value, super.signFile, () {
      super.signFile = value;
    });
  }

  late final _$_SignInfoOccurrenceStoreActionController = ActionController(
    name: '_SignInfoOccurrenceStore',
    context: context,
  );

  @override
  void signInfoOccurrenceChangeForm() {
    final _$actionInfo = _$_SignInfoOccurrenceStoreActionController.startAction(
      name: '_SignInfoOccurrenceStore.signInfoOccurrenceChangeForm',
    );
    try {
      return super.signInfoOccurrenceChangeForm();
    } finally {
      _$_SignInfoOccurrenceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _unfocusResponsible() {
    final _$actionInfo = _$_SignInfoOccurrenceStoreActionController.startAction(
      name: '_SignInfoOccurrenceStore._unfocusResponsible',
    );
    try {
      return super._unfocusResponsible();
    } finally {
      _$_SignInfoOccurrenceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTapFinalizeOccurrenceButton() {
    final _$actionInfo = _$_SignInfoOccurrenceStoreActionController.startAction(
      name: '_SignInfoOccurrenceStore.onTapFinalizeOccurrenceButton',
    );
    try {
      return super.onTapFinalizeOccurrenceButton();
    } finally {
      _$_SignInfoOccurrenceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
responsibleController: ${responsibleController},
isSignInfoOccurrenceFormValid: ${isSignInfoOccurrenceFormValid},
signInfoOccurrenceFormKey: ${signInfoOccurrenceFormKey},
responsibleFocusNode: ${responsibleFocusNode},
signFile: ${signFile}
    ''';
  }
}
