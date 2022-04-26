import 'package:image_search_app_09_clean_architecture/model/photo.dart';

// interface
abstract class PhotoApiRepository {
  Future<List<Photo>> fetch(String query);
}
