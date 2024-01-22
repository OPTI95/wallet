import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CameraWidget extends StatefulWidget {
  final CameraController? controller;
  CameraWidget({super.key, this.controller});

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.controller != null
          ? SafeArea(
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: widget.controller!.value.aspectRatio / 3.5,
                    child: CameraPreview(widget.controller!),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                      onPressed: () async {
                        XFile photoFile =
                            await widget.controller!.takePicture();
                        Navigator.pop(context, photoFile);
                      },
                      icon: Icon(
                        Icons.photo_camera,
                        size: 50,
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey)),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width - 50,
                      child: const Card(
                        color: Colors.transparent,
                        clipBehavior: Clip.hardEdge,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Text("В процессе"),
    );
  }
}
