import 'package:image_search_app_08_changenotifierprovider_consumer/model/photo.dart';

// interface
abstract class PhotoApiRepository {
  Future<List<Photo>> fetch(String query);
}
