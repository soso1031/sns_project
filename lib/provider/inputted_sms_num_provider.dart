import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:two_sns/class/sms_verify.dart';

///NotifierProvider（Freezedで作成したクラスを元に作成）
final smsNumNotifierProvider =
    NotifierProvider<SmsNumNotifierFreezed, SmsVerify>(
        SmsNumNotifierFreezed.new);

class SmsNumNotifierFreezed extends Notifier<SmsVerify> {
  @override
  SmsVerify build() {
    // Inside "build", we return the initial state of the counter.
    return const SmsVerify(inputtedNum: '', isVerify: true);
  }

  //NotifierにTextEditingControllerを管理させる
  TextEditingController controller = TextEditingController();

  //入力内容が変更
  void changeInputtedText(String newInput) {
    state = SmsVerify(inputtedNum: newInput, isVerify: state.isVerify);
  }

  //入力内容を全削除
  void clearInputtedText() {
    controller.clear();
    state = SmsVerify(inputtedNum: '', isVerify: state.isVerify);
  }

  //入力状況等をリセットする
  void resetVerifyData() {
    controller.clear();
    state = const SmsVerify(inputtedNum: '', isVerify: true);
  }

  //入力された番号を承認へ
  //todo:現在は挙動を確認するために成否を引数で渡す
  Future<void> sendSmsNum(bool isPassed) async {
    await Future.delayed(const Duration(seconds: 1));
    if (isPassed) {
      state = SmsVerify(inputtedNum: state.inputtedNum, isVerify: true);
      print('認証に成功しました');
    } else {
      state = SmsVerify(inputtedNum: state.inputtedNum, isVerify: false);
      print('認証に失敗しました');
    }
  }
}
