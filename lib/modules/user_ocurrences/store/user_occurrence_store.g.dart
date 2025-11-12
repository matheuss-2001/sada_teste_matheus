// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_occurrence_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserOccurrenceStore on _UserOccurrenceStore, Store {
  late final _$loadingListOccurrenceAtom = Atom(
    name: '_UserOccurrenceStore.loadingListOccurrence',
    context: context,
  );

  @override
  bool get loadingListOccurrence {
    _$loadingListOccurrenceAtom.reportRead();
    return super.loadingListOccurrence;
  }

  @override
  set loadingListOccurrence(bool value) {
    _$loadingListOccurrenceAtom.reportWrite(
      value,
      super.loadingListOccurrence,
      () {
        super.loadingListOccurrence = value;
      },
    );
  }

  late final _$_getListOccurrenceAvailableAsyncAction = AsyncAction(
    '_UserOccurrenceStore._getListOccurrenceAvailable',
    context: context,
  );

  @override
  Future<void> _getListOccurrenceAvailable() {
    return _$_getListOccurrenceAvailableAsyncAction.run(
      () => super._getListOccurrenceAvailable(),
    );
  }

  @override
  String toString() {
    return '''
loadingListOccurrence: ${loadingListOccurrence}
    ''';
  }
}
