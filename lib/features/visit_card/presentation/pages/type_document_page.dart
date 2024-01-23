import 'package:flutter/material.dart';
import 'package:vkarmane/core/global_widgets/app_bar_widget.dart';

class TypeDocumentPage extends StatelessWidget {
  TypeDocumentPage({super.key});
  final List<String> listTypeDocuments = [
    "Паспорт РФ",
    "СНИЛС",
    "ИНН",
    "Полис ОМС"
  ];
  final List<String> listIconDocuments = [
    "passport",
    "snils",
    "document",
    "polis"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        bottom: const AppBarWidget(
          viewSearch: true,
          viewAdd: false,
          nameAppBar: "Тип документа",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: ListView.builder(
            itemCount: listTypeDocuments.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){},
                  child: Row(
                    children: [
                      ImageIcon(AssetImage("images/${listIconDocuments[index]}.png"), size: 45, color: Colors.white,),
                      SizedBox(width: 15,),
                      Text(
                        listTypeDocuments[index],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
