import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:sada_teste_matheus/modules/occurrence/data/models/occurrence_viewmodel.dart';

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

  final OccurrenceViewmodel _occurrenceViewmodel = OccurrenceViewmodel(
    plate: '',
    photoBytes: Uint8List(0),
    responsibleName: '',
    responsibleSignBytes: Uint8List(0),
    dateTimeRegisterOccurrence: DateTime.now(),
    dateTimeRegisterSigned: DateTime.now(),
  );

  void onTapBackPage() {
    Modular.to.pop();
  }

  @action
  void occurrenceChangeForm() {
    isOccurrenceFormValid = occurrenceFormKey.currentState!.validate() && imagePicked != null;
  }

  @action
  Future<void> onTapForwardOccurrenceButton() async {
    await _populateOccurrenceModel();
    Modular.to.pushNamed('sign_info_occurrence_page', arguments: {"occurrence_viewmodel": _occurrenceViewmodel});
  }

  Future<void> _populateOccurrenceModel() async {
    String plateClean = plateController.text.replaceAll("-", "");
    _occurrenceViewmodel.plate = plateClean;
    _occurrenceViewmodel.dateTimeRegisterOccurrence = DateTime.now();
    _occurrenceViewmodel.photoBytes = await _occurrenceViewmodel.fileToBytes(imagePicked!);
  }

  @action
  void _unfocusPlate() {
    plateFocusNode.unfocus();
  }

  @action
  Future<void> openCamera(BuildContext context) async {
    _unfocusPlate();
    try {
      final XFile? xFile = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 70);
      if (xFile != null) {
        imagePicked = File(xFile.path);
        occurrenceChangeForm();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 4),
          action: SnackBarAction(label: 'FECHAR', textColor: Colors.white, onPressed: () {}),
        ),
      );
    }
  }

  @action
  Future<void> openGallery(BuildContext context) async {
    _unfocusPlate();
    try {
      final XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (xFile != null) {
        imagePicked = File(xFile.path);
        occurrenceChangeForm();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 4),
          action: SnackBarAction(label: 'FECHAR', textColor: Colors.white, onPressed: () {}),
        ),
      );
    }
  }

  @action
  Future<void> excludeCurrentPhoto() async {
    _unfocusPlate();
    imagePicked = null;
    occurrenceChangeForm();
  }
}
