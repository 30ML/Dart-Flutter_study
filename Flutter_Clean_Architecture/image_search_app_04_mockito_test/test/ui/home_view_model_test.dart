import 'package:flutter_test/flutter_test.dart';
import 'package:image_search_app_04_mockito_test/data/photo_api_repository.dart';
import 'package:image_search_app_04_mockito_test/model/photo.dart';
import 'package:image_search_app_04_mockito_test/ui/home_view_model.dart';

void main() {
  test('Stream이 잘 작동해야 함.', () async {
    final viewModel = HomeViewModel(FakePhotoApiRepository());
    // Test는 의존되는 객체 때문에 결과가 달라지면 안됨.

    viewModel.fetch('apple');
    viewModel.fetch('apple');

    final result = fakeJson.map((e) => Photo.fromMap(e)).toList();

    expect(
      viewModel.photoStream,
      emitsInOrder([
        equals([]),
        equals(result),
        equals(result),
        // equals(result), // FAIL
        // isA<List<Photo>>(),
        // isA<List<Photo>>(),
      ]),
    );
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<List<Photo>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));

    return fakeJson.map((e) => Photo.fromMap(e)).toList();
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 5043708,
    "pageURL":
        "https://pixabay.com/photos/honey-beekeeper-beekeeping-glass-5043708/",
    "type": "photo",
    "tags": "honey, beekeeper, beekeeping",
    "previewURL":
        "https://cdn.pixabay.com/photo/2020/04/14/18/13/honey-5043708_150.jpg",
    "previewWidth": 150,
    "previewHeight": 100,
    "webformatURL":
        "https://pixabay.com/get/gc6343fa77881bd61e1dc7b503c9cb25e47d8745a04f9ab4bf034bc396d23fd1f9372b3e1e7c0293d0585210b9c6e9e290deb05dc9b68e2dbfeb24a083ab92bfb_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 427,
    "largeImageURL":
        "https://pixabay.com/get/g5db16eb98f14b6bc085e98f0fb6eee67611f78d4a0444fe8791fa4f9f8f1ec730cd2c25f2a9756064ce7f4b852e0859cc436b3a8dc1373bf83b1cba0452b7607_1280.jpg",
    "imageWidth": 5184,
    "imageHeight": 3456,
    "imageSize": 702028,
    "views": 28618,
    "downloads": 19513,
    "collections": 607,
    "likes": 97,
    "comments": 20,
    "user_id": 37761,
    "user": "Lolame",
    "userImageURL":
        "https://cdn.pixabay.com/user/2019/05/19/22-51-58-56_250x250.jpg"
  },
  {
    "id": 3950334,
    "pageURL":
        "https://pixabay.com/photos/black-flower-woman-colour-window-3950334/",
    "type": "photo",
    "tags": "black, flower, woman",
    "previewURL":
        "https://cdn.pixabay.com/photo/2019/01/23/14/06/black-3950334_150.jpg",
    "previewWidth": 104,
    "previewHeight": 150,
    "webformatURL":
        "https://pixabay.com/get/g49c590dcac6f4807dd2edbc1da86329abc823f58aa5b801bb6eb0195238da23f35f239b3b8fff7657745b8334105d520c8024d142cdf91992670417d3418b5e0_640.jpg",
    "webformatWidth": 445,
    "webformatHeight": 640,
    "largeImageURL":
        "https://pixabay.com/get/g78d5bf23beafe190f2c69b14b982748133896f7fb8509e4853726c2337695e0d346c8c87cae807ad938fbac80d6250c008d01f832942f5ea00345785ca57a28a_1280.jpg",
    "imageWidth": 3707,
    "imageHeight": 5324,
    "imageSize": 3880219,
    "views": 10707,
    "downloads": 6712,
    "collections": 200,
    "likes": 57,
    "comments": 12,
    "user_id": 6333711,
    "user": "fkabay",
    "userImageURL":
        "https://cdn.pixabay.com/user/2018/12/12/09-40-27-899_250x250.jpg"
  },
];
