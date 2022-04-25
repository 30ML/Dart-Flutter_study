import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Photo {
  late final int id;
  late final String pageURL;
  late final String type;
  late final String tags;
  late final String previewURL;
  late final int previewWidth;
  late final int previewHeight;
  late final String webformatURL;
  late final int webformatWidth;
  late final int webformatHeight;
  late final String largeImageURL;
  late final int imageWidth;
  late final int imageHeight;
  late final int imageSize;
  late final int views;
  late final int downloads;
  late final int collections;
  late final int likes;
  late final int comments;
  late final int userId;
  late final String user;
  late final String userImageURL;

  Photo({
    required this.id,
    required this.pageURL,
    required this.type,
    required this.tags,
    required this.previewURL,
    required this.previewWidth,
    required this.previewHeight,
    required this.webformatURL,
    required this.webformatWidth,
    required this.webformatHeight,
    required this.largeImageURL,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageSize,
    required this.views,
    required this.downloads,
    required this.collections,
    required this.likes,
    required this.comments,
    required this.userId,
    required this.user,
    required this.userImageURL,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'pageURL': pageURL,
      'type': type,
      'tags': tags,
      'previewURL': previewURL,
      'previewWidth': previewWidth,
      'previewHeight': previewHeight,
      'webformatURL': webformatURL,
      'webformatWidth': webformatWidth,
      'webformatHeight': webformatHeight,
      'largeImageURL': largeImageURL,
      'imageWidth': imageWidth,
      'imageHeight': imageHeight,
      'imageSize': imageSize,
      'views': views,
      'downloads': downloads,
      'collections': collections,
      'likes': likes,
      'comments': comments,
      'userId': userId,
      'user': user,
      'userImageURL': userImageURL,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      id: map['id'] as int,
      pageURL: map['pageURL'] as String,
      type: map['type'] as String,
      tags: map['tags'] as String,
      previewURL: map['previewURL'] as String,
      previewWidth: map['previewWidth'] as int,
      previewHeight: map['previewHeight'] as int,
      webformatURL: map['webformatURL'] as String,
      webformatWidth: map['webformatWidth'] as int,
      webformatHeight: map['webformatHeight'] as int,
      largeImageURL: map['largeImageURL'] as String,
      imageWidth: map['imageWidth'] as int,
      imageHeight: map['imageHeight'] as int,
      imageSize: map['imageSize'] as int,
      views: map['views'] as int,
      downloads: map['downloads'] as int,
      collections: map['collections'] as int,
      likes: map['likes'] as int,
      comments: map['comments'] as int,
      userId: map['user_id'] as int,
      user: map['user'] as String,
      userImageURL: map['userImageURL'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Photo.fromJson(String source) =>
      Photo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Photo{id: $id}';
  }

  @override
  // int get hashCode => super.hashCode;
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Photo && runtimeType == other.runtimeType && id == other.id;
}
