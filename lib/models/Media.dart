
import 'MediaMetadata.dart';

class Media {
  String type;
  String subtype;
  String caption;
  String copyright;
  int approvedForSyndication;
  List<MediaMetadata> mediaMetadata;

  Media(
      {this.type,
        this.subtype,
        this.caption,
        this.copyright,
        this.approvedForSyndication,
        this.mediaMetadata});

  Media.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    subtype = json['subtype'];
    caption = json['caption'];
    copyright = json['copyright'];
    approvedForSyndication = json['approved_for_syndication'];
    if (json['media-metadata'] != null) {
      mediaMetadata = new List<MediaMetadata>();
      json['media-metadata'].forEach((v) {
        mediaMetadata.add(new MediaMetadata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['subtype'] = this.subtype;
    data['caption'] = this.caption;
    data['copyright'] = this.copyright;
    data['approved_for_syndication'] = this.approvedForSyndication;
    if (this.mediaMetadata != null) {
      data['media-metadata'] =
          this.mediaMetadata.map((v) => v.toJson()).toList();
    }
    return data;
  }
}