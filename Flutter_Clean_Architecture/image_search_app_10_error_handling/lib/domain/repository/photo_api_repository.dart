// interface
import 'package:image_search_app_10_error_handling/domain/model/photo.dart';

abstract class PhotoApiRepository {
  Future<List<Photo>> fetch(String query);
}
