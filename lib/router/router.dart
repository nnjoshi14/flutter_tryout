import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tryout/ui/weather/weather_view.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const WeatherView(),
      ),
    ],
  );
});
