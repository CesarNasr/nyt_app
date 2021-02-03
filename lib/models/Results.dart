
import 'Media.dart';

class Results {
  String uri;
  String url;
  int id;
  int assetId;
  String source;
  String publishedDate;
  String updated;
  String section;
  String subsection;
  String nytdsection;
  String adxKeywords;
  Null column;
  String byline;
  String type;
  String title;
  String abstract;
  List<String> desFacet;
  List<String> orgFacet;
  List<String> perFacet;
  List<String> geoFacet;
  List<Media> media;
  int etaId;

  Results(
      {this.uri,
        this.url,
        this.id,
        this.assetId,
        this.source,
        this.publishedDate,
        this.updated,
        this.section,
        this.subsection,
        this.nytdsection,
        this.adxKeywords,
        this.column,
        this.byline,
        this.type,
        this.title,
        this.abstract,
        this.desFacet,
        this.orgFacet,
        this.perFacet,
        this.geoFacet,
        this.media,
        this.etaId});

  Results.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    url = json['url'];
    id = json['id'];
    assetId = json['asset_id'];
    source = json['source'];
    publishedDate = json['published_date'];
    updated = json['updated'];
    section = json['section'];
    subsection = json['subsection'];
    nytdsection = json['nytdsection'];
    adxKeywords = json['adx_keywords'];
    column = json['column'];
    byline = json['byline'];
    type = json['type'];
    title = json['title'];
    abstract = json['abstract'];
    desFacet = json['des_facet'].cast<String>();
    orgFacet = json['org_facet'].cast<String>();
    perFacet = json['per_facet'].cast<String>();
    geoFacet = json['geo_facet'].cast<String>();
    if (json['media'] != null) {
      media = new List<Media>();
      json['media'].forEach((v) {
        media.add(new Media.fromJson(v));
      });
    }
    etaId = json['eta_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = this.uri;
    data['url'] = this.url;
    data['id'] = this.id;
    data['asset_id'] = this.assetId;
    data['source'] = this.source;
    data['published_date'] = this.publishedDate;
    data['updated'] = this.updated;
    data['section'] = this.section;
    data['subsection'] = this.subsection;
    data['nytdsection'] = this.nytdsection;
    data['adx_keywords'] = this.adxKeywords;
    data['column'] = this.column;
    data['byline'] = this.byline;
    data['type'] = this.type;
    data['title'] = this.title;
    data['abstract'] = this.abstract;
    data['des_facet'] = this.desFacet;
    data['org_facet'] = this.orgFacet;
    data['per_facet'] = this.perFacet;
    data['geo_facet'] = this.geoFacet;
    if (this.media != null) {
      data['media'] = this.media.map((v) => v.toJson()).toList();
    }
    data['eta_id'] = this.etaId;
    return data;
  }
}