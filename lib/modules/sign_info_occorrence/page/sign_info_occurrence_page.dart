import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sada_teste_matheus/helpers/variables/sada_assets.dart';
import 'package:sada_teste_matheus/helpers/variables/sada_spaces.dart';
import 'package:sada_teste_matheus/modules/sign_info_occorrence/store/sign_info_occurrence_store.dart';

class SignInfoOccurrencePage extends StatelessWidget {
  const SignInfoOccurrencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInfoOccurrenceStore store = Modular.get<SignInfoOccurrenceStore>();
    return Scaffold(appBar: _buildAppBar(store), body: _buildBody(context, store));
  }

  AppBar _buildAppBar(SignInfoOccurrenceStore store) {
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

  SafeArea _buildBody(BuildContext context, SignInfoOccurrenceStore store) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: store.signInfoOccurrenceFormKey,
          onChanged: () => store.signInfoOccurrenceChangeForm(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Responsável',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0XFF515458)),
              ),
              SadaSpaces.small,
              TextFormField(
                controller: store.responsibleController,
                focusNode: store.responsibleFocusNode,
                decoration: InputDecoration(
                  hintText: 'Responsável',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                ),
                validator: (responsibleValue) {
                  if (responsibleValue == null || responsibleValue.isEmpty) {
                    return "Preencha o responsável";
                  }
                  return null;
                },
              ),
              SadaSpaces.medium,
              const Text(
                'Assinatura',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0XFF515458)),
              ),
              SadaSpaces.medium,
              GestureDetector(
                onTap: () {
                  store.onTapSignOccurrence();
                },
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: Container(
                    width: double.infinity,
                    height: 128,
                    decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8)),
                    child: Observer(
                      builder: (_) {
                        final File? imageFile = store.signFile;
                        if (imageFile != null) {
                          return Image.file(imageFile, width: 128, height: 128, fit: BoxFit.cover);
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text("Assinatura", style: TextStyle(color: Colors.grey)),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              const Spacer(),
              _buildFinalizeButton(store),
              SadaSpaces.medium,
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildFinalizeButton(SignInfoOccurrenceStore store) {
    return SizedBox(
      width: double.infinity,
      child: Observer(
        builder: (_) => ElevatedButton(
          onPressed: store.isSignInfoOccurrenceFormValid ? store.onTapFinalizeOccurrenceButton : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0XFF006E63),
            padding: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Finalizar',
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
}
