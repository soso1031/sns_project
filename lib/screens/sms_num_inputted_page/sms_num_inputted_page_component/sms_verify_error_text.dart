import 'package:flutter/material.dart';
import 'package:two_sns/class/sms_verify.dart';
import 'package:two_sns/provider/inputted_sms_num_provider.dart';
import 'package:two_sns/res/textStyle/iOS/text_style_jp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SmsVerifyErrorText extends ConsumerWidget {
  const SmsVerifyErrorText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SmsVerify smsVerify = ref.watch(smsNumNotifierProvider); // 表示のとき使う
    return Visibility(
      visible: !smsVerify.isVerify,
      child: const Column(
        children: [
          SizedBox(height: 2),
          Text(
            '番号が正しくありません',
            style: t5NotificationJP,
          ),
          SizedBox(height: 4),
        ],
      ),
    );
  }
}
