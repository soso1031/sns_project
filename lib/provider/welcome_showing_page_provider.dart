import 'package:flutter_riverpod/flutter_riverpod.dart';

///PageViewの現在のページを状態管理で把握
class ShowingPageNotifier extends StateNotifier<int> {
  ShowingPageNotifier() : super(800);

  //現在の表示ページが変更
  void changeShowingPage(int newNum) {
    state = newNum;
  }
}

final showingPageProvider =
    StateNotifierProvider<ShowingPageNotifier, int>((ref) {
  return ShowingPageNotifier();
});
