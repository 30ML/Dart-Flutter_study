// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  final int id;
  final String tags;
  final String previewURL;

  const Photo({
    required this.id,
    required this.tags,
    required this.previewURL,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tags': tags,
      'previewURL': previewURL,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      id: map['id'] as int,
      tags: map['tags'] as String,
      previewURL: map['previewURL'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Photo.fromJson(String source) =>
      Photo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [id, tags, previewURL];
}
