import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

///電話番号の入力状況を状態管理で把握
class InputtedPhoneNumNotifier extends StateNotifier<String> {
  InputtedPhoneNumNotifier() : super('');

  //現在の表示ページが変更
  void changeInputtedText(String newInput) {
    state = newInput;
  }

  //入力内容を全削除
  void clearInputtedText() {
    controller.clear();
    state = '';
  }

  //NotifierにTextEditingControllerを管理
  TextEditingController controller = TextEditingController();
}

final inputtedPhoneNumProvider =
    StateNotifierProvider<InputtedPhoneNumNotifier, String>((ref) {
  return InputtedPhoneNumNotifier();
});
