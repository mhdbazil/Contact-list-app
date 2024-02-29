import 'package:cntimageriverpod/feature/contact/controller/theme_controller.dart';
import 'package:cntimageriverpod/feature/contact/view/viewpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        theme: ref.watch(themeProvider) ? ThemeData.dark() : ThemeData(),
        debugShowCheckedModeBanner: false,
        home: contactPage());
  }
}
