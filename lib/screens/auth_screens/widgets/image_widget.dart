import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.asset('assets/images/smile.jpg',
          alignment: Alignment.center,
          color: Colors.blueGrey,
          colorBlendMode: BlendMode.color,
          fit: BoxFit.cover,
          scale: 1.8,
          height: 120,
          width: 120),
    );
  }
}
