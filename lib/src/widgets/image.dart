import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BikesImage extends StatelessWidget {
  BikesImage({
    @required this.photoUrl,
    this.height = 100,
    this.width = 100
  });

  final String photoUrl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: CachedNetworkImage(
        imageUrl: photoUrl,
        imageBuilder: (context, imageProvider) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.contain,
              )
            ),
          );
        },
        placeholder: (context, url) => _imagePlaceholder(),
        errorWidget: (context, url, error) => _imagePlaceholder()
      )
    );
  }

  Widget _imagePlaceholder(){
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(right: 8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffF0F1F5))
        ),
        child: Container(
          margin: EdgeInsets.all(16),
          child: SvgPicture.asset(
            'assets/no_photo.svg',
          )
        )
      )
    );
  }
}