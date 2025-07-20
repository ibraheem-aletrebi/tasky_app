import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky/Feature/add_task/add_task_screen.dart';
import 'package:tasky/Feature/layaout/screen/layout_screen.dart';
import 'package:tasky/Feature/profile/screen/user_details_screen.dart';
import 'package:tasky/Feature/tasks/screen/high_priority_tasks_screen.dart';
import 'package:tasky/Feature/welcome/welcome_screen.dart';
import 'package:tasky/core/routing/app_routes.dart';
import 'package:tasky/core/services/preference_manegar/preference_manegar.dart';
import 'package:tasky/core/services/preference_manegar/storage_key.dart';

class RouterGenerator {
  final GoRouter routes = GoRouter(
    initialLocation: AppRoutes.kWelcomScreen,

    redirect: (context, state) {
      bool hasUser = PreferenceManegar().getString(StorageKey.userName) != null;
      if (hasUser && state.matchedLocation == AppRoutes.kWelcomScreen) {
        return AppRoutes.kMainScreen;
      }
      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.kWelcomScreen,
        name: AppRoutes.kWelcomScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const WelcomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.kMainScreen,
        name: AppRoutes.kMainScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const LayoutScreen(),
      ),
      GoRoute(
        path: AppRoutes.kAddTaskScreen,
        name: AppRoutes.kAddTaskScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const AddTaskScreen(),
      ),
      GoRoute(
        path: AppRoutes.kUserDetailsScreen,
        name: AppRoutes.kUserDetailsScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const UserDetailsScreen(),
      ),
      GoRoute(
        path: AppRoutes.kHighPriorityTasksScreen,
        name: AppRoutes.kHighPriorityTasksScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const HighPriorityTasksScreen(),
      ),
    ],
  );
}
