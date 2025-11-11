import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'occurrence_store.g.dart';

class OccurrenceStore = _OccurrenceStore with _$OccurrenceStore;

abstract class _OccurrenceStore with Store {
  @observable
  TextEditingController plateController = TextEditingController();

  @observable
  bool isOccurrenceFormValid = false;

  @observable
  GlobalKey<FormState> occurrenceFormKey = GlobalKey<FormState>();

  @observable
  FocusNode plateFocusNode = FocusNode();

  @observable
  File? imagePicked;

  void onTapBackPage() {
    Modular.to.pop();
  }

  @action
  void occurrenceChangeForm() {
    isOccurrenceFormValid = occurrenceFormKey.currentState!.validate();
  }

  @action
  void onTapForwardOccurrenceButton() {
    Modular.to.pushNamed('/');
  }

  @action
  void _unfocusPlate() {
    plateFocusNode.unfocus();
  }

  @action
  Future<void> openCamera() async {
    _unfocusPlate();
  }

  @action
  Future<void> openGallery() async {
    _unfocusPlate();
    final XFile? XFilePicked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (XFilePicked != null) {
      imagePicked = File(XFilePicked.path);
    }
  }
}
