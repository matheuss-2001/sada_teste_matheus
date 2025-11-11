import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sada_teste_matheus/helpers/sada_assets.dart';
import 'package:sada_teste_matheus/helpers/sada_spaces.dart';
import '../store/checklist_store.dart';

class ChecklistPage extends StatelessWidget {
  const ChecklistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0XFF006E63),
      title: const Text(
        'Checklist',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
    );
  }

  SingleChildScrollView _buildBody() {
    final ChecklistStore store = Modular.get<ChecklistStore>();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: InkWell(
              onTap: store.startChecklist,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(8)),
                      child: Image.asset(SadaAssets.iconBoxPlus, width: 32, height: 32),
                    ),
                    SadaSpaces.medium,
                    const Expanded(
                      child: Text(
                        'Ocorrência',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0XFF515458)),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0XFFC6C6C6)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
