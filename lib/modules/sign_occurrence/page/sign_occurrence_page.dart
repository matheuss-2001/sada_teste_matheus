import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sada_teste_matheus/helpers/variables/sada_assets.dart';
import 'package:sada_teste_matheus/helpers/variables/sada_spaces.dart';
import 'package:sada_teste_matheus/modules/sign_occurrence/store/sign_occurrence_store.dart';
import 'package:signature/signature.dart';

class SignOccurrencePage extends StatelessWidget {
  const SignOccurrencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignOccurrenceStore store = Modular.get<SignOccurrenceStore>();
    return Scaffold(appBar: _buildAppBar(store), body: _buildBody(context, store));
  }

  AppBar _buildAppBar(SignOccurrenceStore store) {
    return AppBar(
      backgroundColor: Color(0XFF006E63),
      title: const Text(
        'Assinatura',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: store.onTapBackPage,
        child: Image.asset(SadaAssets.iconArrowLeftGeneral, width: 32, height: 32),
      ),
    );
  }

  SafeArea _buildBody(BuildContext context, SignOccurrenceStore store) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: store.cleanSign,
              child: Row(
                children: [
                  Image.asset(SadaAssets.iconCleanSign, width: 32, height: 32),
                  SadaSpaces.small,
                  const Text(
                    'Limpar',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0XFF515458)),
                  ),
                ],
              ),
            ),
            SadaSpaces.medium,
            Expanded(
              child: Signature(controller: store.signController, backgroundColor: Colors.white),
            ),
            const Spacer(),
            _buildFinalizeButton(store),
            SadaSpaces.medium,
          ],
        ),
      ),
    );
  }

  SizedBox _buildFinalizeButton(SignOccurrenceStore store) {
    return SizedBox(
      width: double.infinity,
      child: Observer(
        builder: (_) => ElevatedButton(
          onPressed: store.canConfirmSignature ? store.onTapConfirmSignedOccurrence : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0XFF006E63),
            padding: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Confirmar',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
              ),
              SadaSpaces.small,
              Image.asset(SadaAssets.iconConfirmSign, width: 32, height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
