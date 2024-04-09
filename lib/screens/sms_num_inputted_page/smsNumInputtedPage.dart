import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_sns/res/color_palette.dart';
import 'package:two_sns/res/textStyle/iOS/text_style_jp.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:two_sns/screens/sms_num_inputted_page/sms_num_inputted_page_component/sms_verify_button.dart';
import 'package:two_sns/ui_component/my_custom_components/tap_shrink_button.dart';

class SmsNumInputtedPage extends StatelessWidget {
  const SmsNumInputtedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: kBlack,
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          behavior: HitTestBehavior.opaque,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                const Column(
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
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Row(
                      children: [
                        OneTapShrinkButton(
                          duration: const Duration(milliseconds: 120),
                          shrinkSize: 0.94,
                          onPressedCallback: () async {
                            await Future.delayed(
                                const Duration(milliseconds: 80));
                            context.pop();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(17),
                            height: 58,
                            width: 58,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1D1C1F),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/button_arrow_left.svg',
                            ),
                          ),
                        ),
                        const Spacer(),
                        const SmsVerifyButton()
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
