import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final Color backgroundColor;
  final Widget? placeholder;
  const CustomNetworkImage({
    Key? key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.backgroundColor = const Color(0xFFA7A7A7),
    this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: backgroundColor,
      child: imageUrl.isNotEmpty
          ? CachedNetworkImage(
              fadeInDuration: const Duration(seconds: 0),
              fit: fit,
              imageUrl: imageUrl,
              placeholder: (context, url) => renderPlaceholder(context),
              errorWidget: (context, url, error) => renderPlaceholder(context),
            )
          : placeholder ?? renderPlaceholder(context),
    );
  }

  renderPlaceholder(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Icon(
        Icons.error_outline_outlined,
        color: Colors.red,
        size: 45,
      ),
    );
  }
}
