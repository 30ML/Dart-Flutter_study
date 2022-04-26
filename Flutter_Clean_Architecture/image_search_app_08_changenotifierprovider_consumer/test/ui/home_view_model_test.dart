import 'package:flutter_test/flutter_test.dart';
import 'package:image_search_app_08_changenotifierprovider_consumer/data/photo_api_repository.dart';
import 'package:image_search_app_08_changenotifierprovider_consumer/model/photo.dart';
import 'package:image_search_app_08_changenotifierprovider_consumer/ui/home_view_model.dart';

void main() {
  test('Stream이 잘 작동해야 함.', () async {
    final viewModel = HomeViewModel(FakePhotoApiRepository());
    // Test는 의존되는 객체 때문에 결과가 달라지면 안됨.

    viewModel.fetch('apple');

    final List<Photo> result = fakeJson.map((e) => Photo.fromJson(e)).toList();

    expect(
      // viewModel.photoStream,
      // emitsInOrder([
      //   equals([]),
      //   equals(result),
      //   equals(result),
      // ]),
      viewModel.photos,
      result,
    );
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<List<Photo>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));

    return fakeJson.map((e) => Photo.fromJson(e)).toList();
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 410311,
    "pageURL":
        "https://pixabay.com/photos/iphone-hand-screen-smartphone-apps-410311/",
    "type": "photo",
    "tags": "iphone, hand, screen",
    "previewURL":
        "https://cdn.pixabay.com/photo/2014/08/05/10/27/iphone-410311_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g2c8a231cb7e82b42e1a5d2860553fa8d645f6785a31233c5da9db0ab03a7c542b99466a76463815ed611b4d2ee4b6fe6_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/g679ce0c9c91f28d8cf56dc1a03997792ec7a529ca04d3b57706308d96ac41305f6cb4cc73a3ab7ebaa6a004331a41393c9d92fcf3b24569dc6ec28ab7fc6850a_1280.jpg",
    "imageWidth": 1920,
    "imageHeight": 1280,
    "imageSize": 416413,
    "views": 486622,
    "downloads": 238688,
    "collections": 5545,
    "likes": 579,
    "comments": 159,
    "user_id": 264599,
    "user": "JESHOOTS-com",
    "userImageURL":
        "https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"
  },
  {
    "id": 410324,
    "pageURL":
        "https://pixabay.com/photos/iphone-smartphone-apps-apple-inc-410324/",
    "type": "photo",
    "tags": "iphone, smartphone, apps",
    "previewURL":
        "https://cdn.pixabay.com/photo/2014/08/05/10/30/iphone-410324_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g98d14fdd101873422d42a25b0d5a20ec8bc2e551031e82eef7e0db0fc728d6fe8a3010e5c9118bb670ad45ed75360be4_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/ge2a76979eac15e738da2e5837207c5d420c0ed8a749db9e7103df98a765b8b8e9d1a2a637605f6268a856a44c515897a6c6cbc3542328ffb1fd0e5636dcd03fd_1280.jpg",
    "imageWidth": 2180,
    "imageHeight": 1453,
    "imageSize": 477025,
    "views": 638749,
    "downloads": 358874,
    "collections": 6604,
    "likes": 754,
    "comments": 194,
    "user_id": 264599,
    "user": "JESHOOTS-com",
    "userImageURL":
        "https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"
  },
];
