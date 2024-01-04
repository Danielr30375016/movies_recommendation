import 'package:movies_recommendation/domain/models/astronomy_pictures_model.dart';
import 'package:movies_recommendation/domain/models/comic.dart';

abstract class ComicsRepository {
  Future<Temperatures> getAllComics();
  Future<List<AstronomyPicturesModel>> getAstronomyPictures();
}
