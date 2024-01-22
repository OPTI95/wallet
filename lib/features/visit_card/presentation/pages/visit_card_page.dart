import 'package:flutter/material.dart';

import '../../../../core/global_widgets/app_bar_widget.dart';
import '../../../../core/global_widgets/empty_info_widget.dart';

class VisitCardPage extends StatelessWidget {
  const VisitCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        bottom: const AppBarWidget(
          nameAppBar: "Визитки",
        ),
      ),
      body: const EmptyinfoWidget(
        infoText: "Добавьте вашу первую визитку",
        textInButton: "Добавить визитку",
      ),
    );
  }
}
