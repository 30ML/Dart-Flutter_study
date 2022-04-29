// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Note _$$_NoteFromJson(Map<String, dynamic> json) => _$_Note(
      id: json['id'] as int?,
      timestamp: json['timestamp'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      color: json['color'] as int,
    );

Map<String, dynamic> _$$_NoteToJson(_$_Note instance) => <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp,
      'title': instance.title,
      'content': instance.content,
      'color': instance.color,
    };
