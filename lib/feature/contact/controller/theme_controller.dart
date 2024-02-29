import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeControll extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void Switcher() {
    state = !state;
  }
}

final themeProvider =
    NotifierProvider<ThemeControll, bool>(() => ThemeControll());
