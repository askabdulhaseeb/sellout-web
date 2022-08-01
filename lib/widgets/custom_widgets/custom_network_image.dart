import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    required this.imageURL,
    this.fit = BoxFit.cover,
    this.timeLimit = const Duration(days: 2),
    this.borderRadius = 0,
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);
  final String imageURL;
  final BoxFit? fit;
  final Duration? timeLimit;
  final double borderRadius;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: ExtendedImage.network(
          imageURL,
          fit: fit,
          timeLimit: timeLimit,
          handleLoadingProgress: true,
          cacheMaxAge: timeLimit,
        ),
      ),
    );
  }
}
