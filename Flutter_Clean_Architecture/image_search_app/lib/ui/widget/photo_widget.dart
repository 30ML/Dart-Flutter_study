// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:image_search_app/model/photo.dart';

class PhotoWidget extends StatelessWidget {
  final Photo photo;

  const PhotoWidget({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(photo.previewURL), // CHECK
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
