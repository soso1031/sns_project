import 'package:flutter/material.dart';
import 'package:two_sns/class/sms_verify.dart';
import 'package:two_sns/res/color_palette.dart';
import 'package:two_sns/res/textStyle/common/text_style_en.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:two_sns/provider/inputted_sms_num_provider.dart';

class SmsNumTextFieldArea extends ConsumerWidget {
  const SmsNumTextFieldArea({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneNumProvider =
        ref.watch(smsNumNotifierProvider.notifier); // 変更のとき使う
    SmsVerify smsVerify = ref.watch(smsNumNotifierProvider); // 表示のとき使う

    return Stack(
      children: [
        //ダミーのヒントテキスト
        Visibility(
          visible: smsVerify.inputtedNum.isEmpty,
          child: const Padding(
            padding: EdgeInsets.only(top: 7.0),
            child: Text(
              '・・・・・・',
              style: TextStyle(
                fontFamily: "Inter",
                decoration: TextDecoration.none,
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
                color: kGrey650,
              ),
            ),
          ),
        ),
        //textField & クリアボタン
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: phoneNumProvider.controller,
                onChanged: (inputText) {
                  phoneNumProvider.changeInputtedText(inputText);
                },
                // 数値のキーボードが表示される
                keyboardType: TextInputType.number,
                // コピペなどで数字以外の入力を防ぐ
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 6,
                autofocus: true,
                style: h1NumWhite,
                cursorColor: kGrey650,
                //textFieldに入力した文字が中央からズレるのを調整する
                strutStyle: const StrutStyle(
                  fontSize: 24,
                  height: 1.3,
                ),
                decoration: const InputDecoration(
                  //TextFieldの高さは内部パディングで調整する
                  contentPadding: EdgeInsets.symmetric(),

                  //TextField背景色&形状
                  fillColor: Colors.transparent,

                  //maxLengthのカウンターを消す
                  counterText: '',
                  filled: false,
                  border: InputBorder.none,
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                phoneNumProvider.clearInputtedText();
              },
              child: Visibility(
                visible: smsVerify.inputtedNum.isNotEmpty,
                child: Container(
                  height: 40,
                  width: 24,
                  color: Colors.red.withOpacity(0),
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    padding: const EdgeInsets.all(4.5),
                    decoration: const BoxDecoration(
                      // color: Color(0xFF333333),
                      color: kGrey750,
                      shape: BoxShape.circle,
                    ),
                    child:
                        SvgPicture.asset('assets/icons/text_field_delete.svg'),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
