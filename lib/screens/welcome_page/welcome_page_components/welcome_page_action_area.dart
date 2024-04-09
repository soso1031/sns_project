import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_sns/ui_component/button/important_decision_button.dart';
import 'package:flutter/services.dart';

class WelcomePageActionArea extends StatelessWidget {
  const WelcomePageActionArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        child: Row(
          children: [
            ImportantDecisionButtonOnlyText(
              buttonText: 'ログイン',
              iconSrc: 'assets/icons/button_arrow_right.svg',
              onPressed: () {
                HapticFeedback.mediumImpact();
              },
            ),
            const Spacer(),
            ImportantDecisionButton(
              buttonWidth: 156,
              buttonText: '初めての方',
              iconSrc: 'assets/icons/button_arrow_right.svg',
              onPressed: () async {
                HapticFeedback.mediumImpact();
                await Future.delayed(const Duration(milliseconds: 80));
                context.push('/verify_account');
              },
            )
          ],
        ),
      ),
    ));
  }
}
