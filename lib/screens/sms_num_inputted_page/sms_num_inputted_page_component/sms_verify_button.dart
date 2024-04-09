import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:two_sns/res/color_palette.dart';
import 'package:two_sns/res/textStyle/iOS/button_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class SmsVerifyButton extends ConsumerStatefulWidget {
  const SmsVerifyButton({super.key});

  @override
  ConsumerState<SmsVerifyButton> createState() => _SmsVerifyButtonState();
}

class _SmsVerifyButtonState extends ConsumerState<SmsVerifyButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 120),
  );

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool isTaped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: isTaped
          ? null
          : () async {
              setState(() {
                isTaped = true;
              });
              HapticFeedback.mediumImpact();
              await Future.delayed(const Duration(seconds: 1));
              // await _animationController.forward();
              // await _animationController.reverse();

              setState(() {
                isTaped = false;
              });
            },
      onHighlightChanged: (isHighlighted) {
        isHighlighted
            ? _animationController.forward()
            : _animationController.reverse();
      },
      child: ScaleTransition(
        alignment: Alignment.center,
        scale: _animationController
            .drive(
              CurveTween(
                curve: Curves.fastOutSlowIn,
              ),
            )
            .drive(
              Tween<double>(
                begin: 1,
                end: 0.95,
              ),
            ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeOut,
          padding: isTaped ? null : const EdgeInsets.only(left: 20, right: 13),
          height: 58,
          width: isTaped ? 58 : 156,
          decoration: BoxDecoration(
            //todo:タップできるかどうかの判別
            color: true ? kWhite : kGrey800,
            borderRadius: BorderRadius.circular(16),
          ),
          child: isTaped
              ? const Padding(
                  padding: EdgeInsets.all(20),
                  child: CupertinoActivityIndicator(
                    color: kGrey900,
                  ),
                )
              : SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: 123,
                    child: Row(
                      children: [
                        const Text(
                          '認証',
                          style: largeButtonTextBlack,
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 0.5),
                          child: SvgPicture.asset(
                            'assets/icons/button_arrow_right.svg',
                            colorFilter:
                                const ColorFilter.mode(kBlack, BlendMode.srcIn),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          // : Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       const Text(
          //         '認証',
          //         style: largeButtonTextBlack,
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(top: 0.5),
          //         child: SvgPicture.asset(
          //           'assets/icons/button_arrow_right.svg',
          //           colorFilter:
          //               const ColorFilter.mode(kBlack, BlendMode.srcIn),
          //         ),
          //       ),
          //     ],
          //   ),
        ),
      ),
    );
  }
}
