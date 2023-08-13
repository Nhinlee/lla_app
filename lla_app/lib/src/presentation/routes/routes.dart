import 'package:go_router/go_router.dart';
import 'package:lla_app/presentation.dart';

class AppRoutes {
  static const homeScreen = '/';
  // static const login = '/login';
  // static const editProfile = '/edit_profile';
  // static const splashScreen = '/splash_screen';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.homeScreen,
  routes: [
    GoRoute(
      path: AppRoutes.homeScreen,
      builder: (context, state) => const HomeScreen(),
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
