import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:two_sns/provider/inputted_sms_num_provider.dart';
import 'package:two_sns/res/color_palette.dart';
import 'package:two_sns/res/textStyle/iOS/button_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:two_sns/ui/view/account_create_page/account_create_page_components/user_name_text_field.dart';

class AccountCreateButton extends ConsumerStatefulWidget {
  const AccountCreateButton({super.key});

  @override
  ConsumerState<AccountCreateButton> createState() => _SmsVerifyButtonState();
}

class _SmsVerifyButtonState extends ConsumerState<AccountCreateButton>
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
    String inputtedUserName = ref.watch(accountCreateUserNameNotifierProvider);
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: isTaped ||
          inputtedUserName.isNotEmpty ||
          inputtedUserName.length > 20
          ? null
          : () async {
        setState(() {
          isTaped = true;
        });
        HapticFeedback.mediumImpact();
        await ref.read(smsNumNotifierProvider.notifier).sendSmsNum(true);

        ///todo:SMS認証の成否によって処理を分ける
        if (ref
            .watch(smsNumNotifierProvider)
            .isVerify) {
          // ignore: use_build_context_synchronously
          context.push('/account_create');
        } else {
          setState(() {
            isTaped = false;
          });
        }
        // await _animationController.forward();
        // await _animationController.reverse();
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
          duration: const Duration(milliseconds: 60),
          decoration: BoxDecoration(
            color: inputtedUserName.isNotEmpty && inputtedUserName.length <= 20
                ? kWhite
                : kGrey800,
            borderRadius: BorderRadius.circular(16),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            padding:
            isTaped ? null : const EdgeInsets.only(left: 20, right: 13),
            height: 58,
            width: isTaped ? 58 : 156,
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
                      '決定',
                      style: largeButtonTextBlack,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 0.5),
                      child: SvgPicture.asset(
                        'assets/icons/button_arrow_right.svg',
                        colorFilter: const ColorFilter.mode(
                            kBlack, BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
