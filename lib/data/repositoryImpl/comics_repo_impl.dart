import 'package:get_it/get_it.dart';
import 'package:movies_recommendation/data/api/comics_api.dart';
import 'package:movies_recommendation/data/api/nasa_api.dart';
import 'package:movies_recommendation/domain/models/astronomy_pictures_model.dart';
import 'package:movies_recommendation/domain/models/comic.dart';
import 'package:movies_recommendation/domain/repository/comics_repository.dart';

class ComicsRepoImpl extends ComicsRepository {
  final ComicsApi _comicsApi = GetIt.I<ComicsApi>();
  final NasaApi _nasaApi = GetIt.I<NasaApi>();

  @override
  Future<Temperatures> getAllComics() async {
    Temperatures comics = await _comicsApi.getAllComicsApi();
    return comics;
  }

  @override
  Future<List<AstronomyPicturesModel>> getAstronomyPictures() async {
    List<AstronomyPicturesModel> astronomyImages =
        await _nasaApi.getAstronomyPictures();
    return astronomyImages;
  }
}
