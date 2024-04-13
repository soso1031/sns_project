import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

///一つ前の画面に戻るボタン
class NavigatePopButton extends StatelessWidget {
  const NavigatePopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OneTapShrinkButtonMiddle(
      duration: const Duration(milliseconds: 120),
      shrinkSize: 0.94,
      onPressedCallback: () {
        context.pop();
      },
      child: Container(
        padding: const EdgeInsets.all(17),
        height: 58,
        width: 58,
        decoration: BoxDecoration(
          color: const Color(0xFF1D1C1F),
          borderRadius: BorderRadius.circular(16),
        ),
        child: SvgPicture.asset(
          'assets/icons/button_arrow_left.svg',
        ),
      ),
    );
  }
}

class OneTapShrinkButtonMiddle extends StatefulWidget {
  const OneTapShrinkButtonMiddle({
    super.key,
    this.child,
    required this.onPressedCallback,
    required this.duration,
    required this.shrinkSize,
  }) : assert(shrinkSize >= 0.0 && shrinkSize <= 1.0);

  final Widget? child;
  final Function()? onPressedCallback;
  final Duration duration;
  final double shrinkSize;

  @override
  State<OneTapShrinkButtonMiddle> createState() =>
      _OneTapShrinkButtonMiddleState();
}

class _OneTapShrinkButtonMiddleState extends State<OneTapShrinkButtonMiddle>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: widget.duration,
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
      onTap: isTaped || widget.onPressedCallback == null
          ? null
          : () async {
              setState(() {
                isTaped = true;
              });
              await _animationController.forward();
              //ここに渡ってきた処理を入れる
              widget.onPressedCallback!();
              if (!mounted) return;
              await _animationController.reverse();
              if (mounted) {
                setState(() {
                  isTaped = false;
                });
              }
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
                end: widget.shrinkSize,
              ),
            ),
        child: widget.child,
      ),
    );
  }
}
