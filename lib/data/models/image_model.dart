import '../../domain/Image_entity.dart';

class ImageModel extends ImageEntity {
  ImageModel(super.id, super.url, super.info, super.height, super.width);
  factory ImageModel.fromJson(dynamic json) => ImageModel(
      json['id'], json ['url'], json ['info'], json['height'],json['width']
  );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {
      'id': id,
      'url': url,
      'info':info,
      'width' :width,
      'height' : height
    };
    return json;
  }



}