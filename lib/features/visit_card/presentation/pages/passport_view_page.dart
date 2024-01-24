import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math';

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
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Text(
                            "РОССИЙСКАЯ ФЕДЕРАЦИЯ",
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Паспорт выдан ",
                                style: TextStyle(fontSize: 12),
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    '',
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Text(
                                    '',
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Text(
                                    '',
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Дата выдачи ",
                                style: TextStyle(fontSize: 12),
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    '',
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "Код подразделения ",
                                style: TextStyle(fontSize: 12),
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    '',
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Text(
                                    '',
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Image.asset(
                                "images/shtamp.png",
                                width: 100,
                              ),
                              Expanded(
                                  child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Text(
                                            '',
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Личный код",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Text(
                                            '',
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Подпись",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ))
                            ],
                          )
                        ],
                      ),
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

class MyCircularProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: CustomPaint(
        painter: MyPainter(),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) async {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    // Радиус внешней окружности
    double outerRadius = size.width / 2;

    // Радиус внутренней окружности
    double innerRadius = outerRadius * 0.7;

    // Центр внешней окружности
    Offset outerCenter = Offset(size.width / 2, size.height / 3);

    // Центр внутренней окружности
    Offset innerCenter = Offset(size.width / 2, size.height / 3);

    // Рисуем внешнюю окружность
    canvas.drawCircle(outerCenter, outerRadius, paint);

    // Рисуем внутреннюю окружность
    paint.color = Colors.red;
    canvas.drawCircle(innerCenter, innerRadius, paint);
// Рисуем текст между кругами
    String text = "Федеральная миграционная служба";
    drawTextOnArc(canvas, text, innerRadius, outerRadius, innerCenter);
    // Рисуем текст
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: "Текст",
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(innerCenter.dx - textPainter.width / 2,
          innerCenter.dy - textPainter.height / 2),
    );
  }

  void drawTextOnArc(Canvas canvas, String text, double innerRadius,
      double outerRadius, Offset center) {
    double radius = (innerRadius + outerRadius) / 2;
    double angle = 0;

    for (int i = 0; i < text.length; i++) {
      String char = text[i];

      TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: char,
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      double charAngle = angle - pi / 2;
      double x = center.dx + radius * cos(charAngle) - textPainter.width / 2;
      double y = center.dy + radius * sin(charAngle) - textPainter.height / 2;

      canvas.save();
      canvas.translate(x, y);
      textPainter.paint(canvas, Offset(0, 0));
      canvas.restore();

      angle += textPainter.width / radius;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
