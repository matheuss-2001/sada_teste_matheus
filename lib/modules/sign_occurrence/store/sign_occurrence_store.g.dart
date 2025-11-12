// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_occurrence_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignOccurrenceStore on _SignOccurrenceStore, Store {
  Computed<bool>? _$canConfirmSignatureComputed;

  @override
  bool get canConfirmSignature =>
      (_$canConfirmSignatureComputed ??= Computed<bool>(
        () => super.canConfirmSignature,
        name: '_SignOccurrenceStore.canConfirmSignature',
      )).value;

  late final _$_isDrawingPresentAtom = Atom(
    name: '_SignOccurrenceStore._isDrawingPresent',
    context: context,
  );

  @override
  bool get _isDrawingPresent {
    _$_isDrawingPresentAtom.reportRead();
    return super._isDrawingPresent;
  }

  @override
  set _isDrawingPresent(bool value) {
    _$_isDrawingPresentAtom.reportWrite(value, super._isDrawingPresent, () {
      super._isDrawingPresent = value;
    });
  }

  late final _$onTapConfirmSignedOccurrenceAsyncAction = AsyncAction(
    '_SignOccurrenceStore.onTapConfirmSignedOccurrence',
    context: context,
  );

  @override
  Future<void> onTapConfirmSignedOccurrence() {
    return _$onTapConfirmSignedOccurrenceAsyncAction.run(
      () => super.onTapConfirmSignedOccurrence(),
    );
  }

  late final _$_SignOccurrenceStoreActionController = ActionController(
    name: '_SignOccurrenceStore',
    context: context,
  );

  @override
  void cleanSign() {
    final _$actionInfo = _$_SignOccurrenceStoreActionController.startAction(
      name: '_SignOccurrenceStore.cleanSign',
    );
    try {
      return super.cleanSign();
    } finally {
      _$_SignOccurrenceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _updateSignatureState() {
    final _$actionInfo = _$_SignOccurrenceStoreActionController.startAction(
      name: '_SignOccurrenceStore._updateSignatureState',
    );
    try {
      return super._updateSignatureState();
    } finally {
      _$_SignOccurrenceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
canConfirmSignature: ${canConfirmSignature}
    ''';
  }
}
