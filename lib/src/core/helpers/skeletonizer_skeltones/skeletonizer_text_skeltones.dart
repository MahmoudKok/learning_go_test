// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerText extends StatelessWidget {
  final int numberOfWords;
  const SkeletonizerText({
    super.key,
    this.numberOfWords = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Skeleton.unite(child: Text('TEXT' * numberOfWords));
  }
}
