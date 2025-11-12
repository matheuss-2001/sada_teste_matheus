import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sada_teste_matheus/helpers/variables/sada_assets.dart';
import 'package:sada_teste_matheus/helpers/variables/sada_spaces.dart';
import 'package:sada_teste_matheus/modules/success_occurrence/store/success_occurrence_store.dart';

class SuccessOccurrencePage extends StatelessWidget {
  const SuccessOccurrencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final SuccessOccurrenceStore store = Modular.get<SuccessOccurrenceStore>();
    return Scaffold(appBar: _buildAppBar(store), body: _buildBody(context, store));
  }

  AppBar _buildAppBar(SuccessOccurrenceStore store) {
    return AppBar(
      backgroundColor: Color(0XFF006E63),
      title: const Text(
        'Concluído',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: store.onTapBackPage,
        child: Image.asset(SadaAssets.iconArrowLeftGeneral, width: 32, height: 32),
      ),
    );
  }

  SafeArea _buildBody(BuildContext context, SuccessOccurrenceStore store) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SadaSpaces.medium,
            Image.asset(SadaAssets.iconSuccessOccurrence, width: 64, height: 64),
            SadaSpaces.medium,
            const Text(
              'Registrado',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0XFF515458)),
            ),
            SadaSpaces.small,
            const Text(
              'Ocorrência registrada com sucesso.\nOs seguintes dados foram gravados:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Color(0XFF515458)),
            ),
            SadaSpaces.big,
            Card(
              color: Colors.grey.shade100,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildRow('Serviços:', "Ocorrência"),
                    _buildRow('Responsável:', store.occurrenceViewmodel.responsibleName),
                    _buildRow(
                      'Data e hora Ocorrência:',
                      store.occurrenceViewmodel.getDateBrFormat(store.occurrenceViewmodel.dateTimeRegisterOccurrence),
                    ),
                    _buildRow(
                      'Data e hora Assinado:',
                      store.occurrenceViewmodel.getDateBrFormat(store.occurrenceViewmodel.dateTimeRegisterSigned),
                    ),
                    _buildRow('Veículo:', store.occurrenceViewmodel.plate),
                  ],
                ),
              ),
            ),

            const Spacer(),
            _buildFinalizeButton(store),
            SadaSpaces.medium,
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

  SizedBox _buildFinalizeButton(SuccessOccurrenceStore store) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: store.onTapFinalizeProcess,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0XFF006E63),
          padding: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ok',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
