import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:two_sns/res/color_palette.dart';
import 'package:two_sns/res/textStyle/iOS/text_field_text_style.dart';
import 'package:two_sns/res/textStyle/iOS/text_style_jp.dart';
import 'package:two_sns/screens/sms_num_inputted_page/sms_num_inputted_page_component/sms_verify_button.dart';

class AccountCreatePage extends StatelessWidget {
  const AccountCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: kAppBackGround,
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          behavior: HitTestBehavior.opaque,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 48),
                    const Text(
                      'アカウントの作成',
                      style: h1WhiteJP,
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      '相手にはここで設定したユーザーネームと画像が\nプロフィールとして表示されます',
                      style: t3GreyJP,
                    ),
                    const SizedBox(height: 39),
                    Container(
                      height: 80,
                      width: 80,
                      padding: const EdgeInsets.all(26),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF191919),
                      ),
                      child: SvgPicture.asset('assets/icons/camera.svg'),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      height: 58,
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xFF191919),
                      ),
                      child: const Row(
                        children: [
                          Text('あなたの名前', style: kLargeTextFieldGrey),
                        ],
                      ),
                    ),
                  ],
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 24.0),
                    child: Row(
                      children: [
                        Spacer(),
                        SmsVerifyButton(),
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
