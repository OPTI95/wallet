import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vkarmane/core/global_widgets/camera_widget.dart';
import 'package:vkarmane/features/cards/presentation/cubit/cards_cubit.dart';

import '../pages/card_page.dart';

class CardAddWidget extends StatefulWidget {
  CardAddWidget({super.key});

  @override
  State<CardAddWidget> createState() => _CardAddWidgetState();
}

class _CardAddWidgetState extends State<CardAddWidget> {
  final TextEditingController scanCodeController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController numberCardController = TextEditingController();

  final TextEditingController cvcCodeController = TextEditingController();

  late CameraController frontController;

  late CameraController backController;

  XFile? backFile;

  XFile? frontFile;

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
                    const Text("Карта",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    TextButton(
                        onPressed: () async {
                          bool res = await context.read<CardsCubit>().saveCard(
                              nameController.text,
                              numberCardController.text,
                              cvcCodeController.text,
                              scanCodeController.text,
                              backFile!.path,
                              frontFile!.path);
                          if (res == true) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Сохранение произошло успешно!"),
                            ));
                          } else {
                            if (res == false) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Сохранение не произошло!"),
                              ));
                            }
                          }
                        },
                        child: const Text(
                          "Сохранить",
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
                      child: InkWell(
                        onTap: () async {
                          final cameras = await availableCameras();
                          frontController = CameraController(
                              cameras.first, ResolutionPreset.veryHigh);
                          await frontController.initialize();
                          await Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (context) => CameraWidget(
                                        controller: frontController,
                                      )))
                              .then((value) {
                            return frontFile = (value as XFile);
                          }).then((value) => setState(() {}));
                        },
                        child: Card(
                          color: Colors.white70,
                          clipBehavior: Clip.hardEdge,
                          child: Center(
                            child: frontFile == null
                                ? const Text(
                                    "Нажмите чтобы добавить фото",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  )
                                : Row(
                                    children: [
                                      Expanded(
                                          child: Image.file(
                                        File(
                                          frontFile!.path,
                                        ),
                                        filterQuality: FilterQuality.high,
                                        fit: BoxFit.cover,
                                      )),
                                    ],
                                  ),
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
                      child: InkWell(
                        onTap: () async {
                          final cameras = await availableCameras();
                          backController = CameraController(
                              cameras.first, ResolutionPreset.veryHigh);
                          await backController.initialize();
                          await Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (context) => CameraWidget(
                                        controller: backController,
                                      )))
                              .then((value) {
                            return backFile = (value as XFile);
                          }).then((value) => setState(() {}));
                        },
                        child: Card(
                          color: Colors.white70,
                          clipBehavior: Clip.hardEdge,
                          child: Center(
                            child: backFile == null
                                ? const Text(
                                    "Нажмите чтобы добавить фото",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  )
                                : Row(
                                    children: [
                                      Expanded(
                                          child: Image.file(
                                        File(
                                          backFile!.path,
                                        ),
                                        filterQuality: FilterQuality.high,
                                        fit: BoxFit.cover,
                                      )),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Название",
                        style: TextStyle(color: Colors.white)),
                    TextField(
                      controller: nameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          hintText: "Введите название",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Скан-код",
                        style: TextStyle(color: Colors.white)),
                    TextField(
                      controller: scanCodeController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          hintText: "Введите скан-код",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("*Номер карты",
                        style: TextStyle(color: Colors.white)),
                    TextField(
                      controller: numberCardController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          hintText: "Введите номер карты",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("*CVC код",
                        style: TextStyle(color: Colors.white)),
                    TextField(
                      controller: cvcCodeController,
                      style: const TextStyle(color: Colors.white),
                      maxLength: 3,
                      decoration: const InputDecoration(
                          hintText: "Введите cvc",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300)),
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
