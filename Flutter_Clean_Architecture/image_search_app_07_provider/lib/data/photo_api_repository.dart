import 'package:image_search_app_07_provider/model/photo.dart';

// interface
abstract class PhotoApiRepository {
  Future<List<Photo>> fetch(String query);
}
