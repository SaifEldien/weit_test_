import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:wiet_test/presentation/screens.dart';

import '../data/models/image_model.dart';


class ImageItem extends StatefulWidget {
  final ImageModel imageModel;

  const ImageItem({Key? key, required this.imageModel}) : super(key: key);

  @override
  State<ImageItem> createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem> {
  double height = 0;
  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (BuildContext context, ConnectivityResult connectivity, Widget child) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (!connected) {
          return
            const Center(child: SizedBox(width:40,height:40,child: CircularProgressIndicator(strokeWidth:7,)));
        } else {
          return  Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                image: DecorationImage(
                    image: Image.network(
                      widget.imageModel.url,
                    ).image,
                    fit: BoxFit.fill)),
            child: InkWell(
              onTap: () {
                height == 0
                    ? height = MediaQuery.sizeOf(context).height*0.08
                    : height = 0;
                setState(() {});
              },
              onDoubleTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          ImageWithInfo(imageModel: widget.imageModel)),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnimatedContainer(
                    height: height,
                    curve: Curves.fastOutSlowIn,
                    padding: const EdgeInsets.all(15.0),
                    duration: const Duration(seconds: 1),
                    child: Text(
                      widget.imageModel.id,
                      style: TextStyle(color: Colors.white.withOpacity(0.6)),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

      },
      child: Container(),
    );
  }
}