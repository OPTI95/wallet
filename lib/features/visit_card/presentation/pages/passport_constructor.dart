import 'package:flutter/material.dart';

class PassportConstructorPage extends StatelessWidget {
  const PassportConstructorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(11.0),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Создание паспорта",
                  style: const TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Имя"),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Фамилия"),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Отчество"),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Дата рождения"),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Серия"),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Номер"),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Код прдразделения"),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Кем выдан"),
              ),
              SizedBox(height: 20,),
              SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Продолжить",
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

class Passport {
  final String name;
  final String secondName;
  final String thirdName;
  final int seria;
  final int number;
  final int code;
  final String issuedFrom;
  final DateTime dateBorn;
  final DateTime dateIssued;

  Passport(
      {required this.name,
      required this.secondName,
      required this.thirdName,
      required this.seria,
      required this.number,
      required this.code,
      required this.issuedFrom,
      required this.dateBorn,
      required this.dateIssued});
}
