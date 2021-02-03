
class MediaMetadata {
  String url;
  String format;
  int height;
  int width;

  MediaMetadata({this.url, this.format, this.height, this.width});

  MediaMetadata.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    format = json['format'];
    height = json['height'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['format'] = this.format;
    data['height'] = this.height;
    data['width'] = this.width;
    return data;
  }
}