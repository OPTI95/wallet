import 'package:flutter/material.dart';

class PassportViewPage extends StatelessWidget {
  const PassportViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Просмотр паспорта",
                    style: const TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Card(
                    margin: EdgeInsets.all(0),
                    child: Column(
                      children: [
                        Text("РОССИЙСКАЯ ФЕДЕРАЦИЯ", style: TextStyle(fontSize: 24),),
                        Row(children: [Text("Паспорт выдан"),   Container(
                              child: Text(
                                'Your Text Here',
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                ),
                              ),
                            ),],)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Card(
                    margin: EdgeInsets.all(0),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
