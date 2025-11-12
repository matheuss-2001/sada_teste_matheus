import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sada_teste_matheus/helpers/variables/sada_assets.dart';
import 'package:sada_teste_matheus/helpers/variables/sada_spaces.dart';
import 'package:sada_teste_matheus/modules/user_ocurrences/store/user_occurrence_store.dart';

class UserOccurrenceDetail extends StatelessWidget {
  const UserOccurrenceDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final UserOccurrenceStore store = Modular.get<UserOccurrenceStore>();
    return Scaffold(appBar: _buildAppBar(store), body: _buildBody(context, store));
  }

  AppBar _buildAppBar(UserOccurrenceStore store) {
    return AppBar(
      backgroundColor: Color(0XFF006E63),
      title: const Text(
        'Detalhe Ocorrência',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: store.onTapBackPage,
        child: Image.asset(SadaAssets.iconArrowLeftGeneral, width: 32, height: 32),
      ),
    );
  }

  SafeArea _buildBody(BuildContext context, UserOccurrenceStore store) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Foto ocorrido',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0XFF515458)),
            ),
            SadaSpaces.medium,
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: Container(
                width: 128,
                height: 128,
                decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8)),
                child: Image.memory(
                  store.occurrenceViewmodelChoose.photoBytes,
                  width: 128,
                  height: 128,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SadaSpaces.medium,
            const Text(
              'Informações',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0XFF515458)),
            ),
            SadaSpaces.medium,
            Card(
              color: Colors.grey.shade100,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildRow('Serviços:', "Ocorrência"),
                    _buildRow('Responsável:', store.occurrenceViewmodelChoose.responsibleName),
                    _buildRow(
                      'Data e hora Ocorrência:',
                      store.occurrenceViewmodelChoose.getDateBrFormat(
                        store.occurrenceViewmodelChoose.dateTimeRegisterOccurrence,
                      ),
                    ),
                    _buildRow(
                      'Data e hora Assinado:',
                      store.occurrenceViewmodelChoose.getDateBrFormat(
                        store.occurrenceViewmodelChoose.dateTimeRegisterSigned,
                      ),
                    ),
                    _buildRow('Veículo:', store.occurrenceViewmodelChoose.plate),
                  ],
                ),
              ),
            ),
            SadaSpaces.medium,
            const Text(
              'Assinatura',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0XFF515458)),
            ),
            SadaSpaces.medium,
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: Container(
                width: double.infinity,
                height: 128,
                decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8)),
                child: Image.memory(
                  store.occurrenceViewmodelChoose.responsibleSignBytes,
                  width: 128,
                  height: 128,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SadaSpaces.big,
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(label, style: const TextStyle(color: Color(0XFF515458))),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0XFF515458)),
            ),
          ),
        ],
      ),
    );
  }
}
