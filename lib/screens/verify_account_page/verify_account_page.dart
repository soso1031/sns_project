import 'package:flutter/material.dart';
import 'package:two_sns/res/color_palette.dart';
import 'package:two_sns/res/textStyle/iOS/text_style_jp.dart';
import 'package:two_sns/screens/verify_account_page/verify_account_page_component/account_verify_text_field_area.dart';
import 'package:two_sns/screens/verify_account_page/verify_account_page_component/send_phone_number_button.dart';
import 'package:two_sns/ui_component/button/navigate_pop_button.dart';

class VerifyAccountPage extends StatelessWidget {
  const VerifyAccountPage({super.key});

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
                      'アカウントの認証',
                      style: h1WhiteJP,
                    ),
                    SizedBox(height: 14),
                    Text(
                      '電話番号を入力してください\n入力した番号にSMSで認証コードを送ります',
                      style: t3GreyJP,
                    ),
                    SizedBox(height: 39),
                    AccountVerifyTextFieldArea(),
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
                        SendPhoneNumberButton()
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
