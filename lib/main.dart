import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vkarmane/core/database_helper/database_help.dart';
import 'package:vkarmane/features/bottom_navigation/presentation/pages/bottom_navigation_page.dart';
import 'package:vkarmane/features/cards/presentation/cubit/cards_cubit.dart';
import 'package:vkarmane/features/cards/presentation/widgets/card_add_widget.dart';
import 'package:vkarmane/features/document/presentation/cubit/document_cubit.dart';
import 'package:vkarmane/features/document/presentation/pages/document_page.dart';
import 'package:vkarmane/features/visit_card/presentation/pages/passport_constructor.dart';
import 'package:vkarmane/features/visit_card/presentation/pages/passport_view_page.dart';
import 'package:vkarmane/features/visit_card/presentation/pages/type_document_page.dart';
import 'package:vkarmane/features/visit_card/presentation/pages/visit_card_page.dart';

import 'features/cards/presentation/pages/card_page.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => CardsCubit(),
      ),
      BlocProvider(
        create: (context) => DocumentCubit(),
      ),
    ], child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      home: PassportViewPage(),
    );
  }
}