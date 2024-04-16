import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:two_sns/provider/welcome_showing_page_provider.dart';
import 'package:two_sns/extension/context_extension.dart';

class WelcomePageIndicator extends ConsumerWidget {
  const WelcomePageIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double indicatorWidth = (context.screenWidth - 48 - 12) / 4;
    int showingPage = ref.watch(showingPageProvider);
    return SafeArea(
        child: Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Row(
          children: [
            LineIndicator(
              indicatorWidth: indicatorWidth,
              showingRemainder: 0,
              showingPage: showingPage % 4,
            ),
            const Spacer(),
            LineIndicator(
              indicatorWidth: indicatorWidth,
              showingRemainder: 1,
              showingPage: showingPage % 4,
            ),
            const Spacer(),
            LineIndicator(
              indicatorWidth: indicatorWidth,
              showingRemainder: 2,
              showingPage: showingPage % 4,
            ),
            const Spacer(),
            LineIndicator(
              indicatorWidth: indicatorWidth,
              showingRemainder: 3,
              showingPage: showingPage % 4,
            ),
          ],
        ),
      ),
    ));
  }
}

class LineIndicator extends StatelessWidget {
  const LineIndicator({
    super.key,
    required this.indicatorWidth,
    required this.showingRemainder,
    required this.showingPage,
  });

  final double indicatorWidth;
  final int showingRemainder;
  final int showingPage;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 80),
      curve: Curves.easeOut,
      height: 3,
      width: indicatorWidth,
      decoration: BoxDecoration(
        color: showingPage == showingRemainder
            ? Colors.white
            : Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
