import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sada_teste_matheus/helpers/variables/sada_assets.dart';
import 'package:sada_teste_matheus/helpers/variables/sada_spaces.dart';
import 'package:sada_teste_matheus/modules/occurrence/data/models/occurrence_viewmodel.dart';
import 'package:sada_teste_matheus/modules/user_ocurrences/store/user_occurrence_store.dart';

class UserOccurrencePage extends StatelessWidget {
  const UserOccurrencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserOccurrenceStore store = Modular.get<UserOccurrenceStore>();
    return Scaffold(appBar: _buildAppBar(store), body: _buildBody(context, store));
  }

  AppBar _buildAppBar(UserOccurrenceStore store) {
    return AppBar(
      backgroundColor: Color(0XFF006E63),
      title: const Text(
        'Ocorrências',
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Observer(
          builder: (_) {
            if (store.loadingListOccurrence) {
              return const Center(child: CircularProgressIndicator(color: Color(0XFF006E63)));
            }
            if (store.listOccurrenceViewmodelAvailable.isEmpty) {
              return Center(
                child: Text('Não há sugestões disponiveis', style: TextStyle(fontSize: 16, color: Colors.grey)),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(store.listOccurrenceViewmodelAvailable.length, (index) {
                final OccurrenceViewmodel itemOccurrence = store.listOccurrenceViewmodelAvailable[index];
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: InkWell(
                    onTap: () {
                      store.onTapDetailUserOccurrence(itemOccurrence);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(SadaAssets.iconBoxPlus, width: 32, height: 32),
                          ),
                          SadaSpaces.medium,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  itemOccurrence.responsibleName,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0XFF515458)),
                                ),
                                Text(itemOccurrence.plate, style: TextStyle(fontSize: 16, color: Color(0XFF515458))),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0XFFC6C6C6)),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
