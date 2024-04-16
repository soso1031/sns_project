import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:two_sns/extension/context_extension.dart';
import 'package:two_sns/res/color_palette.dart';
import 'package:two_sns/res/textStyle/iOS/button_text_style.dart';
import 'package:two_sns/ui/view/welcome_page/welcome_page_components/welcome_page_scroll_content.dart';
import 'package:two_sns/ui_component/button/important_decision_button.dart';
import 'package:two_sns/ui_component/button/navigate_pop_button.dart';

class WelcomePageV2 extends StatelessWidget {
  const WelcomePageV2({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight;
    double screenWidth = context.screenWidth;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            SizedBox(
              height: screenHeight,
              width: screenWidth,
              child: Image.asset(
                'assets/images/app_top_02.png',
                fit: BoxFit.cover,
              ),
            ),
            WelcomePageScrollContent(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomePageListView extends StatefulWidget {
  const WelcomePageListView({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  State<WelcomePageListView> createState() => _WelcomePageListViewState();
}

class _WelcomePageListViewState extends State<WelcomePageListView> {
  late ScrollController _scrollController;

  bool isReadFinish = false;
  double backgroundOpacity = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  ///スクロール箇所を検知してそれに応じた処理を行う
  void _scrollListener() {
    // スクロールを検知したときに呼ばれる
    double scrollPosition =
        _scrollController.offset / _scrollController.position.maxScrollExtent;
    double fixedScrollPosition =
        double.parse(scrollPosition.toStringAsFixed(3));

    ///スクロール量に応じた処理①：下部ボタンの表示非常時
    if (fixedScrollPosition >= 0.94 && isReadFinish == false) {
      setState(() {
        isReadFinish = true;
      });
    } else if (fixedScrollPosition < 0.94 && isReadFinish == true) {
      setState(() {
        isReadFinish = false;
      });
    }

    ///スクロール量に応じた処理②：背景の透明度の変更
    if (fixedScrollPosition < 0 && backgroundOpacity != 0) {
      setState(() {
        backgroundOpacity = 0;
      });
    } else if (fixedScrollPosition >= 0.2 && fixedScrollPosition <= 1) {
      setState(() {
        backgroundOpacity = (fixedScrollPosition - 0.2) * 0.75;
      });
    }
  }

  //listViewの末尾に飛ぶ
  void jumpFinish() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 160),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: widget.screenHeight,
          width: widget.screenWidth,
          decoration: BoxDecoration(
            color: kBlack.withOpacity(backgroundOpacity),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            controller: _scrollController,
            children: [
              SizedBox(height: widget.screenHeight * 0.54),
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                child: SvgPicture.asset(
                  'assets/images/dummy_logo.svg',
                ),
              ),
              const SizedBox(height: 34),
              const Text(
                '長く読んでも疲れにくい柔らかな仮名の骨格を採用したUD書体です。\nストロークをシンプルにし、濁点・半濁点に強調を加えることで、文字のあるべき美しさと誤読防止処理を施しています。\n長く読んでも疲れにくい柔らかな仮名の骨格を採用したUD書体です。',
                style: TextStyle(
                  fontFamily: "Hiragino Sans",
                  decoration: TextDecoration.none,
                  fontSize: 14.0,
                  height: 1.65,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 31),
              SizedBox(
                height: 16.5,
                child: Row(
                  children: [
                    Stack(
                      children: [
                        const Text(
                          'プライバシーポリシー',
                          style: TextStyle(
                            fontFamily: "Hiragino Sans",
                            decoration: TextDecoration.none,
                            fontSize: 12.0,
                            height: 1.5,
                            fontWeight: FontWeight.w700,
                            color: kGrey500,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            child: Container(
                              height: 0.8,
                              width: 120,
                              color: kGrey500.withOpacity(0.9),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 3),
                    const Text(
                      'と',
                      style: TextStyle(
                        fontFamily: "Hiragino Sans",
                        decoration: TextDecoration.none,
                        fontSize: 12.0,
                        height: 1.5,
                        fontWeight: FontWeight.w600,
                        color: kGrey500,
                      ),
                    ),
                    const SizedBox(width: 3),
                    Stack(
                      children: [
                        const Text(
                          '利用規約',
                          style: TextStyle(
                            fontFamily: "Hiragino Sans",
                            decoration: TextDecoration.none,
                            fontSize: 12.0,
                            height: 1.5,
                            fontWeight: FontWeight.w700,
                            color: kGrey500,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            child: Container(
                              height: 0.8,
                              width: 47,
                              color: kGrey500,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 3),
                    const Text(
                      'に',
                      style: TextStyle(
                        fontFamily: "Hiragino Sans",
                        decoration: TextDecoration.none,
                        fontSize: 12.0,
                        height: 1.5,
                        fontWeight: FontWeight.w600,
                        color: kGrey500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '同意して、友達と繋がる',
                style: TextStyle(
                  fontFamily: "Hiragino Sans",
                  decoration: TextDecoration.none,
                  fontSize: 12.0,
                  height: 1.5,
                  fontWeight: FontWeight.w600,
                  color: kGrey500,
                ),
              ),
              SizedBox(
                height: 58 + 16 + context.safeAreaBottomHeight + 3,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: IgnorePointer(
            ignoring: true,
            child: Container(
              height: 120,
              width: widget.screenWidth,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [kBlack.withOpacity(0.01), kBlack],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
        ),

        ///ログイン、登録へ進むボタン
        SafeArea(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: Row(
              children: [
                Visibility(
                  visible: isReadFinish,
                  child: ImportantDecisionButtonOnlyText(
                    buttonText: 'ログイン',
                    iconSrc: 'assets/icons/button_arrow_right.svg',
                    onPressed: () {
                      HapticFeedback.mediumImpact();
                    },
                  ),
                ),
                const Spacer(),
                OneTapShrinkButtonMiddle(
                  duration: const Duration(milliseconds: 120),
                  shrinkSize: 0.95,
                  onPressedCallback: isReadFinish
                      ? () {
                          HapticFeedback.mediumImpact();
                          context.push('/verify_account');
                        }
                      : () {
                          jumpFinish();
                        },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOut,
                    decoration: BoxDecoration(
                      color: isReadFinish ? kWhite : kGrey870,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    width: isReadFinish ? 156 : 58,
                    height: 58,
                    child: isReadFinish
                        ? Padding(
                            padding: const EdgeInsets.only(left: 20, right: 13),
                            child: SingleChildScrollView(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: SizedBox(
                                width: 123,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      '初めての方',
                                      style: largeButtonTextBlack,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0.5),
                                      child: SvgPicture.asset(
                                        'assets/icons/button_arrow_right.svg',
                                        colorFilter: const ColorFilter.mode(
                                            kBlack, BlendMode.srcIn),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(16),
                            child: SvgPicture.asset(
                              'assets/icons/arrow_bottom.svg',
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ],
    );
  }
}
