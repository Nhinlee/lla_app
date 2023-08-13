import 'package:go_router/go_router.dart';
import 'package:lla_app/presentation.dart';

class AppRoutes {
  static const homeScreen = '/';
  static const learningItemDetailScreen = '/learning_item_detail_screen';
// static const login = '/login';
// static const editProfile = '/edit_profile';
// static const splashScreen = '/splash_screen';
}

class ParamKeys {
  static const learningItemId = 'learningItemId';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.homeScreen,
  routes: [
    GoRoute(
      path: AppRoutes.homeScreen,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name:
          '${AppRoutes.learningItemDetailScreen}/:${ParamKeys.learningItemId}',
      path: AppRoutes.learningItemDetailScreen,
      builder: (context, state) => const LearningItemDetailScreen(),
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
