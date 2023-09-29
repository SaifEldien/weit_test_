import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:wiet_test/presentation/widgets.dart';

import '../data/models/image_model.dart';

class ImagesGrid extends StatelessWidget {
  final List<ImageModel> images;
  const ImagesGrid({super.key, required this.images});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 0,
        mainAxisSpacing: 10,
        children: List.generate(
            images.length, (index) => ImageItem(imageModel: images[index])));
  }
}

class ImageWithInfo extends StatelessWidget {
  final ImageModel imageModel;
  const ImageWithInfo({super.key, required this.imageModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.network(
                    imageModel.url,
                  ).image,
                  fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedTextKit(
                  repeatForever: true,
                  pause: const Duration(milliseconds: 10),
                  animatedTexts: [
                    ScaleAnimatedText(
                      imageModel.info,
                      textStyle: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
