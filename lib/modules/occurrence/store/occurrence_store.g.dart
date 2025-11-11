// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occurrence_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OccurrenceStore on _OccurrenceStore, Store {
  late final _$plateControllerAtom = Atom(
    name: '_OccurrenceStore.plateController',
    context: context,
  );

  @override
  TextEditingController get plateController {
    _$plateControllerAtom.reportRead();
    return super.plateController;
  }

  @override
  set plateController(TextEditingController value) {
    _$plateControllerAtom.reportWrite(value, super.plateController, () {
      super.plateController = value;
    });
  }

  late final _$isOccurrenceFormValidAtom = Atom(
    name: '_OccurrenceStore.isOccurrenceFormValid',
    context: context,
  );

  @override
  bool get isOccurrenceFormValid {
    _$isOccurrenceFormValidAtom.reportRead();
    return super.isOccurrenceFormValid;
  }

  @override
  set isOccurrenceFormValid(bool value) {
    _$isOccurrenceFormValidAtom.reportWrite(
      value,
      super.isOccurrenceFormValid,
      () {
        super.isOccurrenceFormValid = value;
      },
    );
  }

  late final _$occurrenceFormKeyAtom = Atom(
    name: '_OccurrenceStore.occurrenceFormKey',
    context: context,
  );

  @override
  GlobalKey<FormState> get occurrenceFormKey {
    _$occurrenceFormKeyAtom.reportRead();
    return super.occurrenceFormKey;
  }

  @override
  set occurrenceFormKey(GlobalKey<FormState> value) {
    _$occurrenceFormKeyAtom.reportWrite(value, super.occurrenceFormKey, () {
      super.occurrenceFormKey = value;
    });
  }

  late final _$plateFocusNodeAtom = Atom(
    name: '_OccurrenceStore.plateFocusNode',
    context: context,
  );

  @override
  FocusNode get plateFocusNode {
    _$plateFocusNodeAtom.reportRead();
    return super.plateFocusNode;
  }

  @override
  set plateFocusNode(FocusNode value) {
    _$plateFocusNodeAtom.reportWrite(value, super.plateFocusNode, () {
      super.plateFocusNode = value;
    });
  }

  late final _$imagePickedAtom = Atom(
    name: '_OccurrenceStore.imagePicked',
    context: context,
  );

  @override
  File? get imagePicked {
    _$imagePickedAtom.reportRead();
    return super.imagePicked;
  }

  @override
  set imagePicked(File? value) {
    _$imagePickedAtom.reportWrite(value, super.imagePicked, () {
      super.imagePicked = value;
    });
  }

  late final _$openCameraAsyncAction = AsyncAction(
    '_OccurrenceStore.openCamera',
    context: context,
  );

  @override
  Future<void> openCamera(BuildContext context) {
    return _$openCameraAsyncAction.run(() => super.openCamera(context));
  }

  late final _$openGalleryAsyncAction = AsyncAction(
    '_OccurrenceStore.openGallery',
    context: context,
  );

  @override
  Future<void> openGallery(BuildContext context) {
    return _$openGalleryAsyncAction.run(() => super.openGallery(context));
  }

  late final _$excludeCurrentPhotoAsyncAction = AsyncAction(
    '_OccurrenceStore.excludeCurrentPhoto',
    context: context,
  );

  @override
  Future<void> excludeCurrentPhoto() {
    return _$excludeCurrentPhotoAsyncAction.run(
      () => super.excludeCurrentPhoto(),
    );
  }

  late final _$_OccurrenceStoreActionController = ActionController(
    name: '_OccurrenceStore',
    context: context,
  );

  @override
  void occurrenceChangeForm() {
    final _$actionInfo = _$_OccurrenceStoreActionController.startAction(
      name: '_OccurrenceStore.occurrenceChangeForm',
    );
    try {
      return super.occurrenceChangeForm();
    } finally {
      _$_OccurrenceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTapForwardOccurrenceButton() {
    final _$actionInfo = _$_OccurrenceStoreActionController.startAction(
      name: '_OccurrenceStore.onTapForwardOccurrenceButton',
    );
    try {
      return super.onTapForwardOccurrenceButton();
    } finally {
      _$_OccurrenceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _unfocusPlate() {
    final _$actionInfo = _$_OccurrenceStoreActionController.startAction(
      name: '_OccurrenceStore._unfocusPlate',
    );
    try {
      return super._unfocusPlate();
    } finally {
      _$_OccurrenceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
plateController: ${plateController},
isOccurrenceFormValid: ${isOccurrenceFormValid},
occurrenceFormKey: ${occurrenceFormKey},
plateFocusNode: ${plateFocusNode},
imagePicked: ${imagePicked}
    ''';
  }
}
