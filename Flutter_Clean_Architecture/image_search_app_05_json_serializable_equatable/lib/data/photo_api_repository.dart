import 'package:image_search_app_05_json_serializable_equatable/model/photo.dart';

// interface
abstract class PhotoApiRepository {
  Future<List<Photo>> fetch(String query);
}
