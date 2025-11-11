import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sada_teste_matheus/helpers/sada_assets.dart';
import 'package:sada_teste_matheus/helpers/sada_spaces.dart';
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
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                ),
                validator: (plateValue) {
                  if (plateValue == null || plateValue.isEmpty) {
                    return "Preencha Placa";
                  }
                  return null;
                },
                inputFormatters: [PlacaVeiculoInputFormatter()],
              ),
              SadaSpaces.big,
              Observer(
                builder: (_) => GestureDetector(
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
                      child: store.imagePicked != null
                          ? Image.file(store.imagePicked!, width: 128, height: 128, fit: BoxFit.cover)
                          : Image.asset(SadaAssets.iconCameraOccurrence, width: 32, height: 32),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
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
              ),
              SadaSpaces.medium,
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
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () {
              store.openCamera();
            },
            leading: const Icon(Icons.camera_alt_outlined),
            title: const Text("Câmera"),
          ),
          ListTile(
            onTap: () {
              store.openGallery();
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
