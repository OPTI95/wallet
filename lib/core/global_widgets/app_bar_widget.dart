import 'package:flutter/material.dart';
import 'package:vkarmane/features/cards/presentation/widgets/card_add_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String nameAppBar;
  final bool viewAdd;
  final bool viewSearch;
  const AppBarWidget(
      {super.key, required this.nameAppBar, required this.viewAdd, required this.viewSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Center(
                child: Text(
                  nameAppBar,
                  style: const TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              viewAdd
                  ? IconButton(
                      splashRadius: 30,
                      onPressed: () {
                        if (nameAppBar == "Карты") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CardAddWidget()));
                        }
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      ))
                  : Container()
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          viewSearch?SizedBox(
            height: 50,
            child: TextField(
              style: const TextStyle(color: Colors.white, fontSize: 16),
              decoration: InputDecoration(
                  hintText: "Поиск",
                  hintStyle: const TextStyle(color: Colors.white70),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(4),
                  prefixIcon: const Icon(Icons.search),
                  fillColor: Colors.white12,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none)),
            ),
          ): Container()
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}
