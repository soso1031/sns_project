import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

///電話番号の入力状況を状態管理で把握
///NotifierProvider
final phoneNumNotifierProvider =
    NotifierProvider<PhoneNumNotifier, String>(PhoneNumNotifier.new);

class PhoneNumNotifier extends Notifier<String> {
  @override
  String build() {
    // Inside "build", we return the initial state of the counter.
    return '';
  }

  //NotifierにTextEditingControllerを管理させる
  TextEditingController controller = TextEditingController();

  //入力内容が変更
  void changeInputtedText(String newInput) {
    state = newInput;
  }

  //入力内容を全削除
  void clearInputtedText() {
    controller.clear();
    state = '';
  }
}
