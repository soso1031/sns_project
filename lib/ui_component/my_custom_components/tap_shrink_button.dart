import 'package:flutter/material.dart';

///タップ時に縮むボタン - 連打不可（ウィジェット、発火する関数、デュレーション、小さくなるサイズを渡す）
class OneTapShrinkButton extends StatefulWidget {
  const OneTapShrinkButton({
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
  State<OneTapShrinkButton> createState() => _OneTapShrinkButtonState();
}

class _OneTapShrinkButtonState extends State<OneTapShrinkButton>
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
              //ここに渡ってきた処理を入れる
              widget.onPressedCallback!();
              await _animationController.forward();
              await _animationController.reverse();
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
                end: widget.shrinkSize,
              ),
            ),
        child: widget.child,
      ),
    );
  }
}

///タップ時に縮むボタン（ウィジェット、発火する関数、デュレーション、小さくなるサイズを渡す）
class TapShrinkButton extends StatefulWidget {
  const TapShrinkButton({
    super.key,
    this.child,
    required this.onPressedCallback,
    required this.duration,
    required this.shrinkSize,
  }) : assert(shrinkSize >= 0.0 && shrinkSize <= 1.0);

  final Widget? child;
  final Function() onPressedCallback;
  final Duration duration;
  final double shrinkSize;

  @override
  State<TapShrinkButton> createState() => _TapShrinkButtonState();
}

class _TapShrinkButtonState extends State<TapShrinkButton>
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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        //ここに渡ってきた処理を入れる
        widget.onPressedCallback();
        await _animationController.forward();
        _animationController.reverse();
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

///タップ時に縮み処理を待つボタン - 連打不可（ウィジェット、発火する関数、デュレーション、小さくなるサイズを渡す）
class TapShrinkWaitButton extends StatefulWidget {
  const TapShrinkWaitButton({
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
  State<TapShrinkWaitButton> createState() => _TapShrinkWaitButtonState();
}

class _TapShrinkWaitButtonState extends State<TapShrinkWaitButton>
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
              //ここに渡ってきた処理を入れる
              widget.onPressedCallback!();
              await _animationController.forward();
              await _animationController.reverse();
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
                end: widget.shrinkSize,
              ),
            ),
        child: widget.child,
      ),
    );
  }
}
