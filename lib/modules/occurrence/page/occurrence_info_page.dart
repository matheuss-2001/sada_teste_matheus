import 'dart:io';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sada_teste_matheus/helpers/variables/sada_assets.dart';
import 'package:sada_teste_matheus/helpers/variables/sada_spaces.dart';
import 'package:sada_teste_matheus/modules/occurrence/store/occurrence_store.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class OccurrenceInfoPage extends StatelessWidget {
  const OccurrenceInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OccurrenceStore store = Modular.get<OccurrenceStore>();
    return Scaffold(appBar: _buildAppBar(store), body: _buildBody(context, store));
  }

  AppBar _buildAppBar(OccurrenceStore store) {
    return AppBar(
      backgroundColor: Color(0XFF006E63),
      title: const Text(
        'Ocorrência',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: store.onTapBackPage,
        child: Image.asset(SadaAssets.iconArrowLeftGeneral, width: 32, height: 32),
      ),
    );
  }

  SafeArea _buildBody(BuildContext context, OccurrenceStore store) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: store.occurrenceFormKey,
          onChanged: () => store.occurrenceChangeForm(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Placa Veículo',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0XFF515458)),
              ),
              SadaSpaces.small,
              TextFormField(
                controller: store.plateController,
                focusNode: store.plateFocusNode,
                decoration: InputDecoration(
                  hintText: 'Placa',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                ),
                validator: (plateValue) {
                  if (plateValue == null || plateValue.isEmpty) {
                    return "Preencha Placa";
                  }
                  if (plateValue.trim().length < 8) {
                    return "Placa inválida";
                  }
                  return null;
                },
                inputFormatters: [PlacaVeiculoInputFormatter()],
              ),
              SadaSpaces.big,
              GestureDetector(
                onTap: () {
                  _buildModalChooseTypeInputPhoto(context, store);
                },
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: Container(
                    width: 128,
                    height: 128,
                    decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8)),
                    child: Observer(
                      builder: (_) {
                        final File? imageFile = store.imagePicked;
                        if (imageFile != null) {
                          return Image.file(imageFile, width: 128, height: 128, fit: BoxFit.cover);
                        } else {
                          return Center(child: Image.asset(SadaAssets.iconCameraOccurrence, width: 32, height: 32));
                        }
                      },
                    ),
                  ),
                ),
              ),
              const Spacer(),
              _buildExcludeImageButton(store),
              _buildForwardButton(store),
              SadaSpaces.medium,
            ],
          ),
        ),
      ),
    );
  }

  Observer _buildExcludeImageButton(OccurrenceStore store) {
    return Observer(
      builder: (_) {
        if (store.imagePicked != null) {
          return Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  store.excludeCurrentPhoto();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFF006E63),
                  padding: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Apagar Foto',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    SadaSpaces.small,
                    Icon(Icons.close_outlined, color: Colors.white),
                  ],
                ),
              ),
              SadaSpaces.medium,
            ],
          );
        }
        return Container();
      },
    );
  }

  SizedBox _buildForwardButton(OccurrenceStore store) {
    return SizedBox(
      width: double.infinity,
      child: Observer(
        builder: (_) => ElevatedButton(
          onPressed: store.isOccurrenceFormValid ? store.onTapForwardOccurrenceButton : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0XFF006E63),
            padding: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Avançar',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
              ),
              SadaSpaces.small,
              Image.asset(SadaAssets.iconArrowRightOccurrence, width: 32, height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _buildModalChooseTypeInputPhoto(BuildContext context, OccurrenceStore store) async {
    await showMaterialModalBottomSheet(
      clipBehavior: Clip.antiAlias,
      elevation: 8,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(14), topRight: Radius.circular(14)),
      ),
      context: context,
      builder: (modalContext) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () async {
              await store.openCamera(modalContext);
              Navigator.pop(modalContext);
            },
            leading: const Icon(Icons.camera_alt_outlined),
            title: const Text("Câmera"),
          ),
          ListTile(
            onTap: () async {
              await store.openGallery(modalContext);
              Navigator.pop(modalContext);
            },
            leading: const Icon(Icons.photo_camera_back_outlined),
            title: const Text("Galeria"),
          ),
          SadaSpaces.big,
        ],
      ),
    );
  }
}
