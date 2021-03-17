class WallpaperModel{
  String category;
  int id;
  String resolution;
  String path;
  String source;
  ThumbsModel thumbs;
  String url;
  String short_url;
  WallpaperModel({this.category,this.path,this.resolution,this.thumbs,this.source,this.url,this.short_url,this.id});
  factory WallpaperModel.fromMap(Map<String,dynamic>jsonData){
   return WallpaperModel(
     thumbs: jsonData["thumbs"],
     resolution: jsonData["resolution"],
     path: jsonData["path"],
     category: jsonData["category"],
     source: jsonData["source"],
     url: jsonData["url"],
       short_url:jsonData["short_url"],
     id: jsonData["id"]
   );
  }
}
class ThumbsModel{
  String large;
  String original;
  String small;
  ThumbsModel({this.large,this.original,this.small});
  factory ThumbsModel.fromMap(Map<String,dynamic>jsonData){
    return ThumbsModel(
      large: jsonData["large"],
      small: jsonData["small"],
      original: jsonData["original"]
    );
  }
}
