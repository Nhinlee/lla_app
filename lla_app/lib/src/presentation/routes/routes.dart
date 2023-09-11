import 'package:go_router/go_router.dart';
import 'package:lla_app/presentation.dart';
import 'package:lla_app/src/presentation/screens/splash_screen.dart';

class AppRoutes {
  static const homeScreen = '/';
  static const learningItemDetailScreen = '/learning_item_detail_screen';
  static const uploadLIScreen = '/upload_li_screen';
  static const startLearningScreen = '/start_learning_screen';
  static const flashcardScreen = '/flashcard_screen';
  static const finishLearningFLScreen = '/finish_learning_fl_screen';
  static const loginScreen = '/login_screen';
  static const splashScreen = '/splash_screen';
// static const login = '/login';
// static const editProfile = '/edit_profile';
// static const splashScreen = '/splash_screen';
}

class ParamKeys {
  static const learningItemId = 'learningItemId';
  static const topicId = 'topicId';
  static const index = 'index';
  static const limit = 'limit';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.splashScreen,
  routes: [
    GoRoute(
      path: AppRoutes.homeScreen,
      name: AppRoutes.homeScreen,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '${AppRoutes.learningItemDetailScreen}/${ParamKeys.learningItemId}',
      name: AppRoutes.learningItemDetailScreen,
      builder: (context, state) => const LearningItemDetailScreen(),
    ),
    GoRoute(
      path: '${AppRoutes.startLearningScreen}/${ParamKeys.topicId}',
      name: AppRoutes.startLearningScreen,
      builder: (context, state) => const StartLearningScreen(),
    ),
    GoRoute(
      path: AppRoutes.flashcardScreen,
      name: AppRoutes.flashcardScreen,
      builder: (context, state) => const FlashcardsScreen(),
    ),
    GoRoute(
      path: AppRoutes.finishLearningFLScreen,
      name: AppRoutes.finishLearningFLScreen,
      builder: (context, state) => const FinishLearningFLScreen(),
    ),
    GoRoute(
      path: AppRoutes.loginScreen,
      name: AppRoutes.loginScreen,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.splashScreen,
      name: AppRoutes.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    // GoRoute(
    //   path: AppRoutes.login,
    //   builder: (context, state) => const LoginScreen(),
    // ),
    // GoRoute(
    //   path: AppRoutes.editProfile,
    //   builder: (context, state) => const EditProfileScreen(),
    // ),
  ],
);
