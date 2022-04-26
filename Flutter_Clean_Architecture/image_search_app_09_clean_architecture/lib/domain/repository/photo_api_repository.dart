// interface
import 'package:image_search_app_09_clean_architecture/domain/model/photo.dart';

abstract class PhotoApiRepository {
  Future<List<Photo>> fetch(String query);
}
