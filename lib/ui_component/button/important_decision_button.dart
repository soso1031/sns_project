import 'package:flutter/material.dart';
import 'package:two_sns/ui_component/my_custom_components/tap_shrink_button.dart';
import 'package:two_sns/res/color_palette.dart';
import 'package:two_sns/res/textStyle/iOS/button_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImportantDecisionButtonWithDisable extends StatelessWidget {
  const ImportantDecisionButtonWithDisable({
    required this.buttonWidth,
    required this.buttonText,
    required this.iconSrc,
    required this.onPressed,
    required this.canTap,
    super.key,
  });

  final double buttonWidth;
  final String buttonText;
  final String iconSrc;
  final bool canTap;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return OneTapShrinkButton(
      duration: const Duration(milliseconds: 120),
      shrinkSize: 0.95,
      onPressedCallback: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 60),
        padding: const EdgeInsets.only(left: 20, right: 13),
        height: 58,
        width: buttonWidth,
        decoration: BoxDecoration(
          color: canTap ? kWhite : kGrey800,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              buttonText,
              style: largeButtonTextBlack,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.5),
              child: SvgPicture.asset(
                iconSrc,
                colorFilter: const ColorFilter.mode(kBlack, BlendMode.srcIn),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImportantDecisionButton extends StatelessWidget {
  const ImportantDecisionButton({
    required this.buttonWidth,
    required this.buttonText,
    required this.iconSrc,
    required this.onPressed,
    super.key,
  });

  final double buttonWidth;
  final String buttonText;
  final String iconSrc;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OneTapShrinkButton(
      duration: const Duration(milliseconds: 120),
      shrinkSize: 0.95,
      onPressedCallback: onPressed,
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 13),
        height: 58,
        width: buttonWidth,
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              buttonText,
              style: largeButtonTextBlack,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.5),
              child: SvgPicture.asset(
                iconSrc,
                colorFilter: const ColorFilter.mode(kBlack, BlendMode.srcIn),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImportantDecisionButtonOnlyText extends StatelessWidget {
  const ImportantDecisionButtonOnlyText({
    required this.buttonText,
    required this.iconSrc,
    required this.onPressed,
    super.key,
  });

  final String buttonText;
  final String iconSrc;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OneTapShrinkButton(
      duration: const Duration(milliseconds: 120),
      shrinkSize: 0.94,
      onPressedCallback: onPressed,
      child: Container(
        padding: const EdgeInsets.only(left: 4, right: 13),
        height: 58,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Text(
              buttonText,
              style: largeButtonTextWhite,
            ),
            const SizedBox(width: 7),
            SvgPicture.asset(iconSrc)
          ],
        ),
      ),
    );
  }
}
