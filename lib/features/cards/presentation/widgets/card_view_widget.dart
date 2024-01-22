import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vkarmane/features/cards/presentation/cubit/cards_cubit.dart';

import '../pages/card_page.dart';

class CardViewWidget extends StatelessWidget {
  final int id;
  final String name;
  final String? cvc;
  final String? number;
  final String scan;
  final String back;
  final String front;
  const CardViewWidget(
      {super.key,
      required this.name,
      required this.cvc,
      required this.number,
      required this.scan,
      required this.back,
      required this.front,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => CardPage()));
                        },
                        icon: const Icon(Icons.close)),
                    const Spacer(),
                    Text(name,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    TextButton(
                        onPressed: () async {
                          bool res =
                              await context.read<CardsCubit>().deleteCard(id);
                          if (res == true) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Удаление произошло успешно!"),
                            ));
                          } else {
                            if (res == false) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Удаление не произошло!"),
                              ));
                            }
                          }
                        },
                        child: const Text(
                          "Удалить",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Лицевая сторона",
                        style: TextStyle(color: Colors.white)),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width - 50,
                      child: Card(
                        color: Colors.white70,
                        clipBehavior: Clip.hardEdge,
                        child: Center(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Image.file(
                                File(
                                  front,
                                ),
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Обратная сторона",
                        style: TextStyle(color: Colors.white)),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width - 50,
                      child: Card(
                        color: Colors.white70,
                        clipBehavior: Clip.hardEdge,
                        child: Center(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Image.file(
                                File(
                                  back,
                                ),
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Название",
                        style: TextStyle(color: Colors.white)),
                    Text(
                      name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Скан-код",
                        style: TextStyle(color: Colors.white)),
                    Text(
                      scan,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("*Номер карты",
                        style: TextStyle(color: Colors.white)),
                    Text(
                      number == "" ? "Пусто" : number!,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("*CVC код",
                        style: TextStyle(color: Colors.white)),
                    Text(
                      cvc == "" ? "Пусто" : cvc!,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
