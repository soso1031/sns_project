import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:two_sns/extension/context_extension.dart';
import 'package:two_sns/provider/welcome_showing_page_provider.dart';

class WelcomePageView extends ConsumerWidget {
  const WelcomePageView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageProvider = showingPageProvider;
    late PageController controller =
        PageController(initialPage: ref.read(pageProvider));
    final pages = pageViewContent;

    return PageView.builder(
      onPageChanged: (newPage) {
        ref.read(pageProvider.notifier).changeShowingPage(newPage);
      },
      controller: controller,
      itemBuilder: (context, index) {
        return pages[index % pages.length];
      },
    );
  }
}

final List<Widget> pageViewContent = [
  const WelcomePageViewContentTemplate(
    imgSrc: 'assets/images/app_top_01.png',
    title: '気持ちいいのは\nなぜだろう。',
    sentence: '2人のためだけのアプリ「⚫︎⚫︎⚫︎⚫︎⚫︎」\nあなたと特別な人だけの特別な空間',
  ),
  const WelcomePageViewContentTemplate(
    imgSrc: 'assets/images/app_top_01.png',
    title: 'タイトルをここに\n入れる！！',
    sentence: 'これはダミーテキストです',
  ),
  const WelcomePageViewContentTemplate(
    imgSrc: 'assets/images/app_top_01.png',
    title: 'タイトルをここに\n入れる！！',
    sentence:
        'これはダミーテキストです。これはダミーテキストです\nダミーテキストです。これはダミーテキスト\nダミーテキスト＆これはダミーテキスト',
  ),
  const WelcomePageViewContentTemplate(
    imgSrc: 'assets/images/app_top_01.png',
    title: 'タイトルをここに\n入れる！！',
    sentence: 'これはダミーテキストです。これはダミーテキストです\nダミーテキストです。これはダミーテキスト',
  ),
];

class WelcomePageViewContentTemplate extends StatelessWidget {
  const WelcomePageViewContentTemplate({
    super.key,
    required this.imgSrc,
    required this.title,
    required this.sentence,
  });

  final String imgSrc;
  final String title;
  final String sentence;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: context.screenHeight,
          width: context.screenWidth,
          child: Image.asset(
            imgSrc,
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 70 + 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: "Hiragino Sans",
                    decoration: TextDecoration.none,
                    fontSize: 26.0,
                    height: 1.5,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  sentence,
                  style: const TextStyle(
                    fontFamily: "Hiragino Sans",
                    decoration: TextDecoration.none,
                    fontSize: 13.0,
                    height: 1.54,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
