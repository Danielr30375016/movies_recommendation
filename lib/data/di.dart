import 'package:get_it/get_it.dart';
import 'package:movies_recommendation/data/api/comics_api.dart';
import 'package:movies_recommendation/data/api/nasa_api.dart';
import 'package:movies_recommendation/data/repositoryImpl/comics_repo_impl.dart';
import 'package:movies_recommendation/domain/models/user.dart';
import 'package:movies_recommendation/domain/repository/comics_repository.dart';
import 'package:movies_recommendation/ui/animes/animes_bloc.dart';
import 'package:movies_recommendation/ui/main_content/main_content_bloc.dart';
import 'package:movies_recommendation/ui/movies/movies_bloc.dart';
import 'package:movies_recommendation/ui/nasa/astronomy_pictures/astronomy_pictures_bloc.dart';

final getIt = GetIt.instance;

void setupLocator(
    String apiUrl, String publicKeyMarvel, String privateKeyMarvel) {
  // API's
  getIt.registerSingleton<ComicsApi>(ComicsApi(
      apiUrl: apiUrl,
      privateKeyMarvel: privateKeyMarvel,
      publicKeyMarvel: publicKeyMarvel));

  getIt.registerSingleton<NasaApi>(NasaApi());

  // Repository
  getIt.registerSingleton<ComicsRepository>(ComicsRepoImpl());

// BLOC's
  getIt.registerSingleton<MoviesBloc>(MoviesBloc(User(
      id: 12345,
      firstName: "Carlosssss",
      lastName: "Ardila",
      email: "carlosArdila@gmail.com")));

  getIt.registerSingleton<AnimesBloc>(AnimesBloc(User(
      id: 12345,
      firstName: "Andressss",
      lastName: "Ardila",
      email: "carlosArdila@gmail.com")));

  getIt.registerSingleton<AstronomyPicturesBloc>(
    AstronomyPicturesBloc(),
  );
  getIt.registerSingleton<MainContentBloc>(MainContentBloc());
}
