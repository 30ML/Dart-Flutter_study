// interface
import 'package:image_search_app_10_error_handling/data/data_source/result.dart';
import 'package:image_search_app_10_error_handling/domain/model/photo.dart';

abstract class PhotoApiRepository {
  Future<Result<List<Photo>>> fetch(String query);
}
