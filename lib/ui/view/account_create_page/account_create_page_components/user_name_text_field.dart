import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:two_sns/res/color_palette.dart';
import 'package:two_sns/res/textStyle/iOS/text_field_text_style.dart';
import 'package:two_sns/res/textStyle/iOS/text_style_jp.dart';

final accountCreateUserNameNotifierProvider =
    NotifierProvider<AccountCreateUserName, String>(AccountCreateUserName.new);

class AccountCreateUserName extends Notifier<String> {
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

///検索ボックス
class UserNameTextField extends ConsumerWidget {
  const UserNameTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNameProvider =
        ref.watch(accountCreateUserNameNotifierProvider.notifier); // 変更のとき使う
    String inputtedUserName = ref.watch(accountCreateUserNameNotifierProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Stack(
          children: [
            ///TextField背景
            Container(
              height: 58,
              decoration: BoxDecoration(
                color: kGreyComponents,
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),

            ///ヒントテキスト
            Visibility(
              visible: inputtedUserName.isEmpty,
              child: Container(
                height: 58,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 16, top: 1),
                child: const Text('あなたの名前', style: kLargeTextFieldGrey),
              ),
            ),

            ///入力欄
            Container(
              height: 58,
              padding: const EdgeInsets.only(right: 17.0),
              child: Material(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3.0, right: 12),
                  child: TextField(
                    //テキストフィールドで発生するイベント用のパラメーター
                    controller: userNameProvider.controller,
                    onChanged: (text) {
                      userNameProvider.changeInputtedText(text);
                    },

                    maxLength: 20,
                    cursorColor: kGrey600,
                    style: kLargeTextFieldWhite,
                    strutStyle: const StrutStyle(
                      fontSize: 15,
                      height: 1.1,
                    ),
                    decoration: const InputDecoration(
                      counterText: '',

                      ///hintText色変更
                      hintStyle: TextStyle(color: kGrey600),

                      ///TextFieldの高さは内部パディングで調整する
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 16),

                      ///TextField背景色&形状
                      fillColor: Colors.transparent,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            ///TextField右入力消去ボタン
            Align(
              alignment: Alignment.centerRight,
              child: Visibility(
                visible: inputtedUserName.isNotEmpty,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    userNameProvider.clearInputtedText();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 9.0, horizontal: 6.0),
                    child: Container(
                      height: 40,
                      width: 40,
                      color: Colors.red.withOpacity(0),
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        padding: const EdgeInsets.all(4.5),
                        decoration: const BoxDecoration(
                          // color: Color(0xFF333333),
                          color: kGrey750,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                            'assets/icons/text_field_delete.svg'),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 9),
        Visibility(
            visible: inputtedUserName.length > 20,
            child: const Text(
              'ユーザーネームは２０文字以内で設定してください',
              style: t5NotificationJP,
            ))
      ],
    );
  }
}
