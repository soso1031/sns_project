// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:two_sns/res/color_palette.dart';
import 'package:two_sns/res/textStyle/iOS/text_style_jp.dart';
import 'package:two_sns/ui/view/sms_num_inputted_page/sms_num_inputted_page_component/sms_num_text_field_area.dart';
import 'package:two_sns/ui/view/sms_num_inputted_page/sms_num_inputted_page_component/sms_resend_timer.dart';
import 'package:two_sns/ui/view/sms_num_inputted_page/sms_num_inputted_page_component/sms_verify_button.dart';
import 'package:two_sns/ui/view/sms_num_inputted_page/sms_num_inputted_page_component/sms_verify_error_text.dart';
import 'package:two_sns/ui_component/button/navigate_pop_button.dart';

class SmsNumInputtedPage extends StatelessWidget {
  const SmsNumInputtedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: kAppBackGround,
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          behavior: HitTestBehavior.opaque,
          child: const SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 48),
                    Text(
                      '認証コードの入力',
                      style: h1WhiteJP,
                    ),
                    SizedBox(height: 14),
                    Text(
                      'SMSで認証コードを送信しました\n届いた6桁の番号を入力してください',
                      style: t3GreyJP,
                    ),
                    SizedBox(height: 39),
                    SmsNumTextFieldArea(),
                    SmsVerifyErrorText(),
                    SmsResendTimer(),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 24.0),
                    child: Row(
                      children: [
                        NavigatePopButton(),
                        Spacer(),
                        SmsVerifyButton()
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
