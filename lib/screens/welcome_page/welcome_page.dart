import 'package:flutter/material.dart';
import 'package:two_sns/screens/welcome_page/welcome_page_components/welcome_page_view.dart';
import 'package:two_sns/screens/welcome_page/welcome_page_components/welcome_page_indicator.dart';
import 'package:two_sns/screens/welcome_page/welcome_page_components/welcome_page_action_area.dart';

///初回起動時にログインorサインアップ
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          ///背景のPageView
          WelcomePageView(),

          ///ページインジケータ
          WelcomePageIndicator(),

          ///ログイン、登録へ進むボタン
          WelcomePageActionArea(),
        ],
      ),
    );
  }
}
