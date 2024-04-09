import 'package:go_router/go_router.dart';
import 'package:two_sns/screens/sms_num_inputted_page/smsNumInputtedPage.dart';
import 'package:two_sns/screens/welcome_page/welcome_page.dart';
import 'package:two_sns/screens/verify_account_page/verify_account_page.dart';

// GoRouter configuration
final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/verify_account',
      name: 'verify_account',
      builder: (context, state) => const VerifyAccountPage(),
    ),
    GoRoute(
      path: '/sms_inputted',
      name: 'sms_inputted',
      builder: (context, state) => const SmsNumInputtedPage(),
    ),
  ],
);
