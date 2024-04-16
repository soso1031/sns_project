import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:two_sns/res/color_palette.dart';
import 'package:two_sns/res/textStyle/iOS/text_style_jp.dart';
import 'package:two_sns/ui/view/account_create_page/account_create_page_components/account_create_button.dart';
import 'package:two_sns/ui/view/account_create_page/account_create_page_components/user_name_text_field.dart';
import 'package:two_sns/ui_component/my_custom_components/tap_shrink_button.dart';
import 'package:image_picker/image_picker.dart';

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
                      OneTapShrinkButton(
                        onPressedCallback: () async {
                          final ImagePicker picker = ImagePicker();
                          final LostDataResponse response =
                              await picker.retrieveLostData();
                          if (response.isEmpty) {
                            return;
                          }
                          final List<XFile>? files = response.files;
                          if (files != null) {
                            // _handleLostFiles(files);
                          } else {
                            // _handleError(response.exception);
                          }
                        },
                        duration: const Duration(milliseconds: 120),
                        shrinkSize: 0.95,
                        child: Container(
                          height: 80,
                          width: 80,
                          padding: const EdgeInsets.all(26),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF191919),
                          ),
                          child: SvgPicture.asset('assets/icons/camera.svg'),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const UserNameTextField(),
                    ],
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 24.0),
                      child: Row(
                        children: [
                          Spacer(),
                          AccountCreateButton(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
