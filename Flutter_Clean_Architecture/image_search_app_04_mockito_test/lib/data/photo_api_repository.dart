import 'package:image_search_app_04_mockito_test/model/photo.dart';

// interface
abstract class PhotoApiRepository {
  Future<List<Photo>> fetch(String query);
}
