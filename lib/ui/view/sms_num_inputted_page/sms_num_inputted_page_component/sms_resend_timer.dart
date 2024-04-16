import 'dart:async';

import 'package:flutter/material.dart';
import 'package:two_sns/res/color_palette.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:two_sns/res/textStyle/iOS/text_style_jp.dart';

class SmsResendTimer extends StatefulWidget {
  const SmsResendTimer({
    super.key,
  });

  @override
  State<SmsResendTimer> createState() => _SmsResendTimerState();
}

class _SmsResendTimerState extends State<SmsResendTimer> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    resendSeconds = 60;
    timer = Timer.periodic(
      // 第一引数：繰り返す間隔の時間を設定
      const Duration(seconds: 1),
      // 第二引数：その間隔ごとに動作させたい処理を書く
      (Timer timer) {
        if (resendSeconds > 1) {
          resendSeconds--;
          setState(() {});
        } else {
          timer.cancel();
          setState(() {
            isResendSms = true;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  late int resendSeconds;
  bool isResendSms = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return isResendSms
        ? InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onHighlightChanged: (isHighlighted) {
              setState(() {
                isPressed = isHighlighted;
              });
            },
            onTap: () {
              setState(() {
                resendSeconds = 60;
                isResendSms = false;
              });
              timer = Timer.periodic(
                // 第一引数：繰り返す間隔の時間を設定
                const Duration(seconds: 1),
                // 第二引数：その間隔ごとに動作させたい処理を書く
                (Timer timer) {
                  if (resendSeconds > 1) {
                    resendSeconds--;
                    setState(() {});
                  } else {
                    timer.cancel();
                    setState(() {
                      isResendSms = true;
                    });
                  }
                },
              );
            },
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: SizedBox(
                  height: 20,
                  child: Row(
                    children: [
                      Text(
                        '認証コードを再送',
                        style: isPressed ? t5GreyJP : t5LightGreyJP,
                      ),
                      const SizedBox(width: 6),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0.5),
                        child: SvgPicture.asset(
                          'assets/icons/resend.svg',
                          colorFilter: ColorFilter.mode(
                              isPressed ? kGrey600 : kGrey300, BlendMode.srcIn),
                        ),
                      ),
                    ],
                  )),
            ),
          )
        : SizedBox(
            height: 20,
            child: Row(
              children: [
                Text(
                  '$resendSeconds',
                  style: t5GreyJP,
                ),
                const SizedBox(width: 2),
                const Text(
                  '秒後にコードを再送できます',
                  style: t5GreyJP,
                ),
              ],
            ),
          );
  }
}
