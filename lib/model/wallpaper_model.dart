class WallpaperModel {
  String category;
  String id;
  String resolution;
  String path;
  String source;
  ThumbsModel thumbs;
  String url;
  String short_url;
  WallpaperModel(
      {this.category,
        this.path,
        this.resolution,
        this.thumbs,
        this.source,
        this.url,
        this.short_url,
        this.id});
  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperModel(
        thumbs: ThumbsModel(
          large: jsonData['thumbs']['large'],
          original: jsonData['thumbs']['original'],
          small: jsonData['thumbs']['small'],
        ),
        resolution: jsonData["resolution"],
        path: jsonData["path"],
        category: jsonData["category"],
        source: jsonData["source"],
        url: jsonData["url"],
        short_url: jsonData["short_url"],
        id: jsonData["id"]);
  }
}

class ThumbsModel {
  String large;
  String original;
  String small;
  ThumbsModel({this.large, this.original, this.small});
  factory ThumbsModel.fromMap(Map<String, dynamic> jsonData) {
    return ThumbsModel(
        large: jsonData["large"],
        small: jsonData["small"],
        original: jsonData["original"]);
  }
}