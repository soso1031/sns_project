import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:two_sns/extension/context_extension.dart';
import 'package:two_sns/res/color_palette.dart';
import 'package:two_sns/res/textStyle/iOS/button_text_style.dart';
import 'package:two_sns/ui_component/button/important_decision_button.dart';
import 'package:two_sns/ui_component/button/navigate_pop_button.dart';

class WelcomePageScrollContent extends HookWidget {
  const WelcomePageScrollContent({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    //下までスクロールして利用規約やプライバシーポリシー等の表示がされているか
    final isReadFinish = useState(false);
    //背景の黒色のOpacity
    final backgroundOpacity = useState(0.0);
    //リストビューのコントローラー
    final controller = useScrollController();

    ///スクロール箇所を検知してそれに応じた処理を行う
    void scrollListener() {
      double scrollPosition =
          controller.offset / controller.position.maxScrollExtent;
      double fixedScrollPosition =
          double.parse(scrollPosition.toStringAsFixed(3));

      //スクロール量に応じた処理①：下部ボタンの表示/非常時
      if (fixedScrollPosition >= 0.8 && isReadFinish.value == false) {
        isReadFinish.value = true;
      } else if (fixedScrollPosition < 0.8 && isReadFinish.value == true) {
        isReadFinish.value = false;
      }

      //\/スクロール量に応じた処理②：背景の透明度の変更
      if (fixedScrollPosition < 0 && backgroundOpacity.value != 0) {
        backgroundOpacity.value = 0;
      } else if (fixedScrollPosition >= 0.2 && fixedScrollPosition <= 1) {
        backgroundOpacity.value = (fixedScrollPosition - 0.2) * 0.75;
      }
    }

    useEffect(() {
      controller.addListener(scrollListener);

      return () => controller.dispose();
    }, [backgroundOpacity, isReadFinish]);

    //listViewの末尾に飛ぶ
    void jumpFinish() {
      controller.animateTo(
        controller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
      );
    }

    return Stack(
      children: [
        Container(
          height: screenHeight,
          width: screenWidth,
          decoration: BoxDecoration(
            color: kBlack.withOpacity(backgroundOpacity.value),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            controller: controller,
            children: [
              SizedBox(height: screenHeight * 0.54),
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
              width: screenWidth,
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
                  visible: isReadFinish.value,
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
                  onPressedCallback: isReadFinish.value
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
                      color: isReadFinish.value ? kWhite : kGrey870,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    width: isReadFinish.value ? 156 : 58,
                    height: 58,
                    child: isReadFinish.value
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
