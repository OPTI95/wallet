import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vkarmane/features/cards/presentation/cubit/cards_cubit.dart';
import 'package:vkarmane/features/cards/presentation/widgets/card_view_widget.dart';

import '../../../../core/global_widgets/app_bar_widget.dart';
import '../../../../core/global_widgets/empty_info_widget.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  void initState() {
    context.read<CardsCubit>().getCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          bottom: const AppBarWidget(
            nameAppBar: "Карты",
          ),
        ),
        body: BlocBuilder<CardsCubit, CardsState>(
          builder: (context, state) {
            if (state is CardsLoadedState) {
              return (context.read<CardsCubit>().state as CardsLoadedState)
                      .list
                      .isEmpty
                  ? RefreshIndicator(
                      onRefresh: () async {
                        return await context
                            .read<CardsCubit>()
                            .getCards()
                            .then((value) {
                          setState(() {});
                        });
                      },
                      child: const EmptyinfoWidget(
                        infoText: "Добавьте вашу первую карту",
                        textInButton: "Добавить карту",
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        return await context
                            .read<CardsCubit>()
                            .getCards()
                            .then((value) {
                          setState(() {});
                        });
                      },
                      child: ListView.builder(
                        itemCount: state.list.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CardViewWidget(
                                          id: state.list[index].id!,
                                          name: state.list[index].name,
                                          cvc: state.list[index].cvcCode,
                                          number: state.list[index].numberCard,
                                          scan: state.list[index].scanCode,
                                          back: state.list[index].backImage,
                                          front:
                                              state.list[index].frontImage)));
                            },
                            child: Column(
                              children: [
                                Text(
                                  state.list[index].name,
                                  style: TextStyle(color: Colors.white),
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
                                              state.list[index].frontImage,
                                            ),
                                            filterQuality: FilterQuality.high,
                                            fit: BoxFit.cover,
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
            } else {
              return const EmptyinfoWidget(
                infoText: "Добавьте вашу первую карту",
                textInButton: "Добавить карту",
              );
            }
          },
        ));
  }
}
