// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_occurrence_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignOccurrenceStore on _SignOccurrenceStore, Store {
  late final _$isOccurredSignedAtom = Atom(
    name: '_SignOccurrenceStore.isOccurredSigned',
    context: context,
  );

  @override
  bool get isOccurredSigned {
    _$isOccurredSignedAtom.reportRead();
    return super.isOccurredSigned;
  }

  @override
  set isOccurredSigned(bool value) {
    _$isOccurredSignedAtom.reportWrite(value, super.isOccurredSigned, () {
      super.isOccurredSigned = value;
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

  @override
  String toString() {
    return '''
isOccurredSigned: ${isOccurredSigned}
    ''';
  }
}
