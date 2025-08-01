import 'package:go_router/go_router.dart';
import 'package:push_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/push-detail/:messageId', builder: (context, state) => PushMessageScreen(messageId: state.pathParameters['messageId'] ?? '')),
  ],
);
