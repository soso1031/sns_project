import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:two_sns/provider/inputted_phone_num_provider.dart';
import 'package:two_sns/ui_component/button/important_decision_button.dart';

class SendPhoneNumberButton extends ConsumerWidget {
  const SendPhoneNumberButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String inputtedText = ref.watch(inputtedPhoneNumProvider);
    return Row(
      children: [
        ImportantDecisionButtonWithDisable(
          buttonWidth: 156,
          buttonText: '次へ',
          iconSrc: 'assets/icons/button_arrow_right.svg',
          canTap: inputtedText.isNotEmpty,
          onPressed: inputtedText.isNotEmpty
              ? () async {
                  HapticFeedback.mediumImpact();
                  await Future.delayed(const Duration(milliseconds: 80));
                  context.push('/sms_inputted');
                }
              : null,
        ),
      ],
    );
  }
}
