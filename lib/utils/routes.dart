import 'package:go_router/go_router.dart';
import 'package:movies_recommendation/ui/animes/animes_screen.dart';
import 'package:movies_recommendation/ui/main_content/main_content_screen.dart';
import 'package:movies_recommendation/ui/movies/movies_screen.dart';
import 'package:movies_recommendation/ui/nasa/astronomy_pictures/astronomy_pictures_screen.dart';
import 'package:movies_recommendation/utils/constants.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: AppConstants.moviesEscreen,
    builder: (context, state) {
      return const AnimesScreen();
    },
  ),
  GoRoute(
      path: AppConstants.mainContent,
      builder: (context, state) => const MainContentScreen()),
  GoRoute(
      path: AppConstants.astronomyPicturesScreen,
      builder: (context, state) => const AstronomyPicturesScreen()),
]);
